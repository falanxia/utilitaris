package Box2D.Dynamics.Joints{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * Mouse joint definition. This requires a world target point,
	 * tuning parameters, and the time step.
	 * @see b2MouseJoint
	 */
	public class b2MouseJointDef extends b2JointDef {
		public function b2MouseJointDef() {
			type = b2Joint.e_mouseJoint;
			maxForce = 0.0;
			frequencyHz = 5.0;
			dampingRatio = 0.7;
		}



		/**
		 * The initial world target point. This is assumed
		 * to coincide with the body anchor initially.
		 */
		public var target:b2Vec2 = new b2Vec2();
		/**
		 * The maximum constraint force that can be exerted
		 * to move the candidate body. Usually you will express
		 * as some multiple of the weight (multiplier * mass * gravity).
		 */
		public var maxForce:Number;
		/**
		 * The response speed.
		 */
		public var frequencyHz:Number;
		/**
		 * The damping ratio. 0 = no damping, 1 = critical damping.
		 */
		public var dampingRatio:Number;
	}
	;

}
