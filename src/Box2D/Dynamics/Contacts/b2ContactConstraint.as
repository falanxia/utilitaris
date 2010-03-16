package Box2D.Dynamics.Contacts{


	import Box2D.Collision.*;
	import Box2D.Common.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	/**
	 * @private
	 */
	public class b2ContactConstraint {
		public function b2ContactConstraint() {
			points = new Array(b2Settings.b2_maxManifoldPoints);
			for(var i:int = 0; i < b2Settings.b2_maxManifoldPoints; i++) {
				points[i] = new b2ContactConstraintPoint();
			}


		}



		public var points:Array;
		public var normal:b2Vec2 = new b2Vec2();
		public var normalMass:b2Mat22 = new b2Mat22();
		public var K:b2Mat22 = new b2Mat22();
		public var manifold:b2Manifold;
		public var body1:b2Body;
		public var body2:b2Body;
		public var friction:Number;
		public var restitution:Number;
		public var pointCount:int;
	}
	;


}
