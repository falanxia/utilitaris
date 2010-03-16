package Box2D.Collision{

	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;

	// This is used for polygon-vs-circle distance.
	/**
	 * @private
	 */
	public class b2Point {
		public function Support(xf:b2XForm, vX:Number, vY:Number):b2Vec2 {
			return p;
		}



		public function GetFirstVertex(xf:b2XForm):b2Vec2 {
			return p;
		}



		public var p:b2Vec2 = new b2Vec2();
	}
	;


}
