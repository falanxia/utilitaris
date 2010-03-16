﻿package Box2D.Dynamics.Joints{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	/**
	 * The base joint class. Joints are used to constraint two bodies together in
	 * various fashions. Some joints also feature limits and motors.
	 * @see b2JointDef
	 */
	public class b2Joint {
		/**
		 * Get the type of the concrete joint.
		 */
		public function GetType():int {
			return m_type;
		}



		/**
		 * Get the anchor point on body1 in world coordinates.
		 */
		public virtual function GetAnchor1():b2Vec2 {
			return null
		}



		;
		/**
		 * Get the anchor point on body2 in world coordinates.
		 */
		public virtual function GetAnchor2():b2Vec2 {
			return null
		}



		;

		/**
		 * Get the reaction force on body2 at the joint anchor.
		 */
		public virtual function GetReactionForce(inv_dt:Number):b2Vec2 {
			return null
		}



		;
		/**
		 * Get the reaction torque on body2.
		 */
		public virtual function GetReactionTorque(inv_dt:Number):Number {
			return 0.0
		}



		/**
		 * Get the first body attached to this joint.
		 */
		public function GetBody1():b2Body {
			return m_body1;
		}



		/**
		 * Get the second body attached to this joint.
		 */
		public function GetBody2():b2Body {
			return m_body2;
		}



		/**
		 * Get the next joint the world joint list.
		 */
		public function GetNext():b2Joint {
			return m_next;
		}



		/**
		 * Get the user data pointer.
		 */
		public function GetUserData():* {
			return m_userData;
		}



		/**
		 * Set the user data pointer.
		 */
		public function SetUserData(data:*):void {
			m_userData = data;
		}



		//--------------- Internals Below -------------------

		static b2internal function Create(def:b2JointDef, allocator:*):b2Joint {
			var joint:b2Joint = null;

			switch(def.type) {
				case e_distanceJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2DistanceJoint));
					joint = new b2DistanceJoint(def as b2DistanceJointDef);
				}
					break;

				case e_mouseJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2MouseJoint));
					joint = new b2MouseJoint(def as b2MouseJointDef);
				}
					break;

				case e_prismaticJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2PrismaticJoint));
					joint = new b2PrismaticJoint(def as b2PrismaticJointDef);
				}
					break;

				case e_revoluteJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2RevoluteJoint));
					joint = new b2RevoluteJoint(def as b2RevoluteJointDef);
				}
					break;

				case e_pulleyJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2PulleyJoint));
					joint = new b2PulleyJoint(def as b2PulleyJointDef);
				}
					break;

				case e_gearJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2GearJoint));
					joint = new b2GearJoint(def as b2GearJointDef);
				}
					break;

				case e_lineJoint:
				{
					//void* mem = allocator->Allocate(sizeof(b2LineJoint));
					joint = new b2LineJoint(def as b2LineJointDef);
				}
					break;

				default:
					//b2Settings.b2Assert(false);
					break;
			}

			return joint;
		}



		static b2internal function Destroy(joint:b2Joint, allocator:*):void {
			/*joint->~b2Joint();
			 switch (joint.m_type)
			 {
			 case e_distanceJoint:
			 allocator->Free(joint, sizeof(b2DistanceJoint));
			 break;

			 case e_mouseJoint:
			 allocator->Free(joint, sizeof(b2MouseJoint));
			 break;

			 case e_prismaticJoint:
			 allocator->Free(joint, sizeof(b2PrismaticJoint));
			 break;

			 case e_revoluteJoint:
			 allocator->Free(joint, sizeof(b2RevoluteJoint));
			 break;

			 case e_pulleyJoint:
			 allocator->Free(joint, sizeof(b2PulleyJoint));
			 break;

			 case e_gearJoint:
			 allocator->Free(joint, sizeof(b2GearJoint));
			 break;

			 case e_lineJoint:
			 allocator->Free(joint, sizeof(b2LineJoint));
			 break;

			 default:
			 b2Assert(false);
			 break;
			 }*/
		}



		/** @private */
		public function b2Joint(def:b2JointDef) {
			m_type = def.type;
			m_prev = null;
			m_next = null;
			m_body1 = def.body1;
			m_body2 = def.body2;
			m_collideConnected = def.collideConnected;
			m_islandFlag = false;
			m_userData = def.userData;
		}



		//virtual ~b2Joint() {}

		b2internal virtual function InitVelocityConstraints(step:b2TimeStep):void {
		}



		;
		b2internal virtual function SolveVelocityConstraints(step:b2TimeStep):void {
		}



		;

		// This returns true if the position errors are within tolerance.
		b2internal virtual function SolvePositionConstraints(baumgarte:Number):Boolean {
			return false
		}



		;

		b2internal function ComputeXForm(xf:b2XForm, center:b2Vec2, localCenter:b2Vec2, angle:Number):void {
			xf.R.Set(angle);
			//xf->position = center - b2Mul(xf->R, localCenter);
			xf.position.SetV(b2Math.SubtractVV(center, b2Math.b2MulMV(xf.R, localCenter)));
		}



		b2internal var m_type:int;
		b2internal var m_prev:b2Joint;
		b2internal var m_next:b2Joint;
		b2internal var m_node1:b2JointEdge = new b2JointEdge();
		b2internal var m_node2:b2JointEdge = new b2JointEdge();
		b2internal var m_body1:b2Body;
		b2internal var m_body2:b2Body;

		b2internal var m_islandFlag:Boolean;
		b2internal var m_collideConnected:Boolean;

		private var m_userData:*;

		// Cache here per time step to reduce cache misses.
		b2internal var m_localCenter1:b2Vec2 = new b2Vec2();
		b2internal var m_localCenter2:b2Vec2 = new b2Vec2();
		b2internal var m_invMass1:Number;
		b2internal var m_invMass2:Number;
		b2internal var m_invI1:Number;
		b2internal var m_invI2:Number;

		// ENUMS

		// enum b2JointType
		static b2internal const e_unknownJoint:int = 0;
		static b2internal const e_revoluteJoint:int = 1;
		static b2internal const e_prismaticJoint:int = 2;
		static b2internal const e_distanceJoint:int = 3;
		static b2internal const e_pulleyJoint:int = 4;
		static b2internal const e_mouseJoint:int = 5;
		static b2internal const e_gearJoint:int = 6;
		static b2internal const e_lineJoint:int = 7;

		// enum b2LimitState
		static b2internal const e_inactiveLimit:int = 0;
		static b2internal const e_atLowerLimit:int = 1;
		static b2internal const e_atUpperLimit:int = 2;
		static b2internal const e_equalLimits:int = 3;

	}
	;


}
