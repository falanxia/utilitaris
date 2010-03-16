﻿package Box2D.Dynamics.Contacts{


	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.b2internal;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	//typedef b2Contact* b2ContactCreateFcn(b2Shape* shape1, b2Shape* shape2, b2BlockAllocator* allocator);
	//typedef void b2ContactDestroyFcn(b2Contact* contact, b2BlockAllocator* allocator);


	/**
	 * The class manages contact between two shapes. A contact exists for each overlapping
	 * AABB in the broad-phase (except if filtered). Therefore a contact object may exist
	 * that has no contact points.
	 */
	public class b2Contact {
		public virtual function GetManifolds():Array {
			return null
		}



		;

		/**
		 * Get the number of manifolds. This is 0 or 1 between convex shapes.
		 * This may be greater than 1 for convex-vs-concave shapes. Each
		 * manifold holds up to two contact points with a shared contact normal.
		 */
		public function GetManifoldCount():int {
			return m_manifoldCount;
		}



		/**
		 * Is this contact solid?
		 * @return true if this contact should generate a response.
		 */
		public function IsSolid():Boolean {
			return (m_flags & e_nonSolidFlag) == 0;
		}



		/**
		 * Get the next contact in the world's contact list.
		 */
		public function GetNext():b2Contact {
			return m_next;
		}



		/**
		 * Get the first shape in this contact.
		 */
		public function GetShape1():b2Shape {
			return m_shape1;
		}



		/**
		 * Get the second shape in this contact.
		 */
		public function GetShape2():b2Shape {
			return m_shape2;
		}



		//--------------- Internals Below -------------------

		// m_flags
		// enum
		static b2internal var e_nonSolidFlag:uint = 0x0001;
		static b2internal var e_slowFlag:uint = 0x0002;
		static b2internal var e_islandFlag:uint = 0x0004;
		static b2internal var e_toiFlag:uint = 0x0008;



		static b2internal function AddType(createFcn:Function, destroyFcn:Function, type1:int, type2:int):void {
			//b2Settings.b2Assert(b2Shape.e_unknownShape < type1 && type1 < b2Shape.e_shapeTypeCount);
			//b2Settings.b2Assert(b2Shape.e_unknownShape < type2 && type2 < b2Shape.e_shapeTypeCount);

			s_registers[type1][type2].createFcn = createFcn;
			s_registers[type1][type2].destroyFcn = destroyFcn;
			s_registers[type1][type2].primary = true;

			if(type1 != type2) {
				s_registers[type2][type1].createFcn = createFcn;
				s_registers[type2][type1].destroyFcn = destroyFcn;
				s_registers[type2][type1].primary = false;
			}
		}



		static b2internal function InitializeRegisters():void {
			s_registers = new Array(b2Shape.e_shapeTypeCount);
			for(var i:int = 0; i < b2Shape.e_shapeTypeCount; i++) {
				s_registers[i] = new Array(b2Shape.e_shapeTypeCount);
				for(var j:int = 0; j < b2Shape.e_shapeTypeCount; j++) {
					s_registers[i][j] = new b2ContactRegister();
				}
			}

			AddType(b2CircleContact.Create, b2CircleContact.Destroy, b2Shape.e_circleShape, b2Shape.e_circleShape);
			AddType(b2PolyAndCircleContact.Create, b2PolyAndCircleContact.Destroy, b2Shape.e_polygonShape, b2Shape.e_circleShape);
			AddType(b2PolygonContact.Create, b2PolygonContact.Destroy, b2Shape.e_polygonShape, b2Shape.e_polygonShape);

			AddType(b2EdgeAndCircleContact.Create, b2EdgeAndCircleContact.Destroy, b2Shape.e_edgeShape, b2Shape.e_circleShape);
			AddType(b2PolyAndEdgeContact.Create, b2PolyAndEdgeContact.Destroy, b2Shape.e_polygonShape, b2Shape.e_edgeShape);
		}



		static b2internal function Create(shape1:b2Shape, shape2:b2Shape, allocator:*):b2Contact {
			if(s_initialized == false) {
				InitializeRegisters();
				s_initialized = true;
			}

			var type1:int = shape1.m_type;
			var type2:int = shape2.m_type;

			//b2Settings.b2Assert(b2Shape.e_unknownShape < type1 && type1 < b2Shape.e_shapeTypeCount);
			//b2Settings.b2Assert(b2Shape.e_unknownShape < type2 && type2 < b2Shape.e_shapeTypeCount);

			var reg:b2ContactRegister = s_registers[type1][type2];
			var createFcn:Function = reg.createFcn;
			if(createFcn != null) {
				if(reg.primary) {
					return createFcn(shape1, shape2, allocator);
				}
				else {
					var c:b2Contact = createFcn(shape2, shape1, allocator);
					for(var i:int = 0; i < c.m_manifoldCount; ++i) {
						var m:b2Manifold = c.GetManifolds()[ i ];
						m.normal = m.normal.Negative();
					}
					return c;
				}
			}
			else {
				return null;
			}
		}



		static b2internal function Destroy(contact:b2Contact, allocator:*):void {
			//b2Settings.b2Assert(s_initialized == true);

			if(contact.m_manifoldCount > 0) {
				contact.m_shape1.m_body.WakeUp();
				contact.m_shape2.m_body.WakeUp();
			}

			var type1:int = contact.m_shape1.m_type;
			var type2:int = contact.m_shape2.m_type;

			//b2Settings.b2Assert(b2Shape.e_unknownShape < type1 && type1 < b2Shape.e_shapeTypeCount);
			//b2Settings.b2Assert(b2Shape.e_unknownShape < type2 && type2 < b2Shape.e_shapeTypeCount);

			var reg:b2ContactRegister = s_registers[type1][type2];
			var destroyFcn:Function = reg.destroyFcn;
			destroyFcn(contact, allocator);
		}



		/** @private */
		public function b2Contact(s1:b2Shape = null, s2:b2Shape = null) {
			m_flags = 0;

			if(!s1 || !s2) {
				m_shape1 = null;
				m_shape2 = null;
				return;
			}

			if(s1.IsSensor() || s2.IsSensor()) {
				m_flags |= e_nonSolidFlag;
			}

			m_shape1 = s1;
			m_shape2 = s2;

			m_manifoldCount = 0;

			m_prev = null;
			m_next = null;

			m_node1.contact = null;
			m_node1.prev = null;
			m_node1.next = null;
			m_node1.other = null;

			m_node2.contact = null;
			m_node2.prev = null;
			m_node2.next = null;
			m_node2.other = null;
		}



		b2internal function Update(listener:b2ContactListener):void {
			var oldCount:int = m_manifoldCount;

			Evaluate(listener);

			var newCount:int = m_manifoldCount;

			var body1:b2Body = m_shape1.m_body;
			var body2:b2Body = m_shape2.m_body;

			if(newCount == 0 && oldCount > 0) {
				body1.WakeUp();
				body2.WakeUp();
			}

			// Slow contacts don't generate TOI events.
			if(body1.IsStatic() || body1.IsBullet() || body2.IsStatic() || body2.IsBullet()) {
				m_flags &= ~e_slowFlag;
			}
			else {
				m_flags |= e_slowFlag;
			}
		}



		//virtual ~b2Contact() {}

		b2internal virtual function Evaluate(listener:b2ContactListener):void {
		}



		;
		static b2internal var s_registers:Array; //[][]
		static b2internal var s_initialized:Boolean = false;

		b2internal var m_flags:uint;

		// World pool and list pointers.
		b2internal var m_prev:b2Contact;
		b2internal var m_next:b2Contact;

		// Nodes for connecting bodies.
		b2internal var m_node1:b2ContactEdge = new b2ContactEdge();
		b2internal var m_node2:b2ContactEdge = new b2ContactEdge();

		b2internal var m_shape1:b2Shape;
		b2internal var m_shape2:b2Shape;

		b2internal var m_manifoldCount:int;

		b2internal var m_toi:Number;

	}
	;


}
