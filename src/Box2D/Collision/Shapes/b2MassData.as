package Box2D.Collision.Shapes{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * This holds the mass data computed for a shape.
	 */
	public class b2MassData {
		/**
		 * The mass of the shape, usually in kilograms.
		 */
		public var mass:Number = 0.0;
		/**
		 * The position of the shape's centroid relative to the shape's origin.
		 */
		public var center:b2Vec2 = new b2Vec2(0, 0);
		/**
		 * The rotational inertia of the shape.
		 */
		public var I:Number = 0.0;
	}

}
