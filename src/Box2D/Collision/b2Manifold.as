package Box2D.Collision{

	import Box2D.Common.*;
	import Box2D.Common.Math.*;



	use namespace b2internal;

	/**
	 * A manifold for two touching convex shapes.
	 * @private
	 */
	public class b2Manifold {
		public function b2Manifold() {
			points = new Array(b2Settings.b2_maxManifoldPoints);
			for(var i:int = 0; i < b2Settings.b2_maxManifoldPoints; i++) {
				points[i] = new b2ManifoldPoint();
			}
			normal = new b2Vec2();
		}



		public function Reset():void {
			for(var i:int = 0; i < b2Settings.b2_maxManifoldPoints; i++) {
				(points[i] as b2ManifoldPoint).Reset();
			}
			normal.SetZero();
			pointCount = 0;
		}



		public function Set(m:b2Manifold):void {
			pointCount = m.pointCount;
			for(var i:int = 0; i < b2Settings.b2_maxManifoldPoints; i++) {
				(points[i] as b2ManifoldPoint).Set(m.points[i]);
			}
			normal.SetV(m.normal);
		}



		/** The points of contact */
		public var points:Array;
		/** The shared unit normal vector */
		public var normal:b2Vec2;
		/** The number of manifold points */
		public var pointCount:int = 0;
	}
	;


}
