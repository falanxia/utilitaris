package Box2D.Dynamics.Joints{


	import Box2D.Common.b2internal;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	/**
	 * Joint definitions are used to construct joints.
	 * @see b2Joint
	 */
	public class b2JointDef {

		public function b2JointDef() {
			type = b2Joint.e_unknownJoint;
			userData = null;
			body1 = null;
			body2 = null;
			collideConnected = false;
		}



		/**
		 * The joint type is set automatically for concrete joint types.
		 */
		public var type:int;
		/**
		 * Use this to attach application specific data to your joints.
		 */
		public var userData:*;
		/**
		 * The first attached body.
		 */
		public var body1:b2Body;
		/**
		 * The second attached body.
		 */
		public var body2:b2Body;
		/**
		 * Set this flag to true if the attached bodies should collide.
		 */
		public var collideConnected:Boolean;

	}

}
