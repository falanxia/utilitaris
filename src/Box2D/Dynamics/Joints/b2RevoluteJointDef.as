﻿package Box2D.Dynamics.Joints{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	/**
	 * Revolute joint definition. This requires defining an
	 * anchor point where the bodies are joined. The definition
	 * uses local anchor points so that the initial configuration
	 * can violate the constraint slightly. You also need to
	 * specify the initial relative angle for joint limits. This
	 * helps when saving and loading a game.
	 * The local anchor points are measured from the body's origin
	 * rather than the center of mass because:
	 * 1. you might not know where the center of mass will be.
	 * 2. if you add/remove shapes from a body and recompute the mass,
	 * the joints will be broken.
	 * @see b2RevoluteJoint
	 */

	public class b2RevoluteJointDef extends b2JointDef {
		public function b2RevoluteJointDef() {
			type = b2Joint.e_revoluteJoint;
			localAnchor1.Set(0.0, 0.0);
			localAnchor2.Set(0.0, 0.0);
			referenceAngle = 0.0;
			lowerAngle = 0.0;
			upperAngle = 0.0;
			maxMotorTorque = 0.0;
			motorSpeed = 0.0;
			enableLimit = false;
			enableMotor = false;
		}



		/**
		 * Initialize the bodies, anchors, and reference angle using the world
		 * anchor.
		 */
		public function Initialize(b1:b2Body, b2:b2Body, anchor:b2Vec2):void {
			body1 = b1;
			body2 = b2;
			localAnchor1 = body1.GetLocalPoint(anchor);
			localAnchor2 = body2.GetLocalPoint(anchor);
			referenceAngle = body2.GetAngle() - body1.GetAngle();
		}



		/**
		 * The local anchor point relative to body1's origin.
		 */
		public var localAnchor1:b2Vec2 = new b2Vec2();

		/**
		 * The local anchor point relative to body2's origin.
		 */
		public var localAnchor2:b2Vec2 = new b2Vec2();

		/**
		 * The body2 angle minus body1 angle in the reference state (radians).
		 */
		public var referenceAngle:Number;

		/**
		 * A flag to enable joint limits.
		 */
		public var enableLimit:Boolean;

		/**
		 * The lower angle for the joint limit (radians).
		 */
		public var lowerAngle:Number;

		/**
		 * The upper angle for the joint limit (radians).
		 */
		public var upperAngle:Number;

		/**
		 * A flag to enable the joint motor.
		 */
		public var enableMotor:Boolean;

		/**
		 * The desired motor speed. Usually in radians per second.
		 */
		public var motorSpeed:Number;

		/**
		 * The maximum motor torque used to achieve the desired motor speed.
		 * Usually in N-m.
		 */
		public var maxMotorTorque:Number;

	}
	;

}
