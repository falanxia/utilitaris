package Box2D.Collision{

	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;

	/**
	 * An oriented bounding box.
	 */
	public class b2OBB {
		/** The rotation matrix */
		public var R:b2Mat22 = new b2Mat22();
		/** The local centroid */
		public var center:b2Vec2 = new b2Vec2();
		/** The half-widths */
		public var extents:b2Vec2 = new b2Vec2();
	}
	;


}
