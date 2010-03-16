package Box2D.Collision {


	/**
	 * @private
	 */
	public class b2Bound {
		public function IsLower():Boolean {
			return (value & 1) == 0;
		}



		public function IsUpper():Boolean {
			return (value & 1) == 1;
		}



		public function Swap(b:b2Bound):void {
			var tempValue:uint = value;
			var tempProxy:b2Proxy = proxy;
			var tempStabbingCount:uint = stabbingCount;

			value = b.value;
			proxy = b.proxy;
			stabbingCount = b.stabbingCount;

			b.value = tempValue;
			b.proxy = tempProxy;
			b.stabbingCount = tempStabbingCount;
		}



		public var value:uint;
		public var proxy:b2Proxy;
		public var stabbingCount:uint;
	}


}
