package Box2D.Dynamics{


	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * A body definition holds all the data needed to construct a rigid body.
	 * You can safely re-use body definitions.
	 */
	public class b2BodyDef {
		/**
		 * This constructor sets the body definition default values.
		 */
		public function b2BodyDef() {
			massData.center.SetZero();
			massData.mass = 0.0;
			massData.I = 0.0;
			userData = null;
			position.Set(0.0, 0.0);
			angle = 0.0;
			linearDamping = 0.0;
			angularDamping = 0.0;
			allowSleep = true;
			isSleeping = false;
			fixedRotation = false;
			isBullet = false;
		}



		/**
		 * You can use this to initialized the mass properties of the body.
		 * If you prefer, you can set the mass properties after the shapes
		 * have been added using b2Body::SetMassFromShapes.
		 * @see b2Body#SetMassFromShapes()
		 */
		public var massData:b2MassData = new b2MassData();

		/**
		 * Use this to store application specific body data.
		 */
		public var userData:*;

		/**
		 * The world position of the body. Avoid creating bodies at the origin
		 * since this can lead to many overlapping shapes.
		 */
		public var position:b2Vec2 = new b2Vec2();

		/**
		 * The world angle of the body in radians.
		 */
		public var angle:Number;

		/**
		 * Linear damping is use to reduce the linear velocity. The damping parameter
		 * can be larger than 1.0f but the damping effect becomes sensitive to the
		 * time step when the damping parameter is large.
		 */
		public var linearDamping:Number;

		/**
		 * Angular damping is use to reduce the angular velocity. The damping parameter
		 * can be larger than 1.0f but the damping effect becomes sensitive to the
		 * time step when the damping parameter is large.
		 */
		public var angularDamping:Number;

		/**
		 * Set this flag to false if this body should never fall asleep. Note that
		 * this increases CPU usage.
		 */
		public var allowSleep:Boolean;

		/**
		 * Is this body initially sleeping?
		 */
		public var isSleeping:Boolean;

		/**
		 * Should this body be prevented from rotating? Useful for characters.
		 */
		public var fixedRotation:Boolean;

		/**
		 * Is this a fast moving body that should be prevented from tunneling through
		 * other moving bodies? Note that all bodies are prevented from tunneling through
		 * static bodies.
		 * @warning You should use this flag sparingly since it increases processing time.
		 */
		public var isBullet:Boolean;
	}
	;


}
