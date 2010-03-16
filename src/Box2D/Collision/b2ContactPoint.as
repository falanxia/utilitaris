package Box2D.Collision{

	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;

	/**
	 * This structure is used to report contact points.
	 */
	public class b2ContactPoint {
		/** The first shape */
		public var shape1:b2Shape;
		/** The second shape */
		public var shape2:b2Shape;
		/** Position in world coordinates */
		public var position:b2Vec2 = new b2Vec2();
		/** Velocity of point on body2 relative to point on body1 (pre-solver) */
		public var velocity:b2Vec2 = new b2Vec2();
		/** Points from shape1 to shape2 */
		public var normal:b2Vec2 = new b2Vec2();
		/** The separation is negative when shapes are touching */
		public var separation:Number;
		/** The combined friction coefficient */
		public var friction:Number;
		/** The combined restitution coefficient */
		public var restitution:Number;
		/** The contact id identifies the features in contact */
		public var id:b2ContactID = new b2ContactID();
	}
	;


}
