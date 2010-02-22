/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package Box2D.Collision.Shapes{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * This structure is used to build circle shapes.
	 * @see b2CircleShape
	 */
	public class b2CircleDef extends b2ShapeDef {
		public function b2CircleDef() {
			type = b2Shape.e_circleShape;
			radius = 1.0;
		}



		/** The circle center in local coordinages */
		public var localPosition:b2Vec2 = new b2Vec2(0.0, 0.0);
		/** The circle radius */
		public var radius:Number;
	}
	;

}
