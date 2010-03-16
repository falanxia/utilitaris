package Box2D.Collision.Shapes{


	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * A shape definition is used to construct a shape. This class defines an
	 * abstract shape definition. You can reuse shape definitions safely.
	 */
	public class b2ShapeDef {
		/**
		 * Holds the shape type for down-casting.
		 */
		public var type:int = b2Shape.e_unknownShape;

		/**
		 * Use this to store application specify shape data.
		 */
		public var userData:* = null;

		/**
		 * The shape's friction coefficient, usually in the range [0,1].
		 */
		public var friction:Number = 0.2;

		/**
		 * The shape's restitution (elasticity) usually in the range [0,1].
		 */
		public var restitution:Number = 0.0;

		/**
		 * The shape's density, usually in kg/m^2.
		 */
		public var density:Number = 0.0;

		/**
		 * A sensor shape collects contact information but never generates a collision
		 * response.
		 */
		public var isSensor:Boolean = false;

		/**
		 * Contact filtering data.
		 */
		public var filter:b2FilterData = new b2FilterData();
	}
	;

}
