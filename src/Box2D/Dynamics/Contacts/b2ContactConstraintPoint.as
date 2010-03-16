﻿package Box2D.Dynamics.Contacts{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * @private
	 */
	public class b2ContactConstraintPoint {
		public var localAnchor1:b2Vec2 = new b2Vec2();
		public var localAnchor2:b2Vec2 = new b2Vec2();
		public var r1:b2Vec2 = new b2Vec2();
		public var r2:b2Vec2 = new b2Vec2();
		public var normalImpulse:Number;
		public var tangentImpulse:Number;
		public var normalMass:Number;
		public var tangentMass:Number;
		public var equalizedMass:Number;
		public var separation:Number;
		public var velocityBias:Number;
	}
	;


}
