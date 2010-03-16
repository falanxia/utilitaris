package Box2D.Collision{

	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;

	/**
	 * An axis aligned bounding box.
	 */
	public class b2AABB {
		/**
		 * Verify that the bounds are sorted.
		 */
		public function IsValid():Boolean {
			//b2Vec2 d = upperBound - lowerBound;;
			var dX:Number = upperBound.x - lowerBound.x;
			var dY:Number = upperBound.y - lowerBound.y;
			var valid:Boolean = dX >= 0.0 && dY >= 0.0;
			valid = valid && lowerBound.IsValid() && upperBound.IsValid();
			return valid;
		}



		/** The lower vertex */
		public var lowerBound:b2Vec2 = new b2Vec2();
		/** The upper vertex */
		public var upperBound:b2Vec2 = new b2Vec2();
	}
	;


}
