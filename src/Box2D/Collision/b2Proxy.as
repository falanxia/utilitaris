package Box2D.Collision{

	import Box2D.Common.b2internal;

	import flash.utils.Dictionary;



	use namespace b2internal;

	/**
	 * @private
	 */
	public class b2Proxy {
		public function IsValid():Boolean {
			return overlapCount != b2BroadPhase.b2_invalid;
		}



		public var lowerBounds:Array = [uint(0), uint(0)];
		public var upperBounds:Array = [uint(0), uint(0)];
		public var overlapCount:uint;
		public var timeStamp:uint;

		// Maps from the other b2Proxy to their mutual b2Pair.
		public var pairs:Dictionary = new Dictionary();

		public var next:b2Proxy;

		public var userData:* = null;
	}


}
