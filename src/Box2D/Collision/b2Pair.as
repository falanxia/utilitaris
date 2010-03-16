// The pair manager is used by the broad-phase to quickly add/remove/find pairs
// of overlapping proxies. It is based closely on code provided by Pierre Terdiman.
// http://www.codercorner.com/IncrementalSAP.txt

package Box2D.Collision{


	import Box2D.Common.*;



	use namespace b2internal;


	/**
	 * A Pair represents a pair of overlapping b2Proxy in the broadphse.
	 * @private
	 */
	public class b2Pair {


		public function SetBuffered():void {
			status |= e_pairBuffered;
		}



		public function ClearBuffered():void {
			status &= ~e_pairBuffered;
		}



		public function IsBuffered():Boolean {
			return (status & e_pairBuffered) == e_pairBuffered;
		}



		public function SetRemoved():void {
			status |= e_pairRemoved;
		}



		public function ClearRemoved():void {
			status &= ~e_pairRemoved;
		}



		public function IsRemoved():Boolean {
			return (status & e_pairRemoved) == e_pairRemoved;
		}



		public function SetFinal():void {
			status |= e_pairFinal;
		}



		public function IsFinal():Boolean {
			return (status & e_pairFinal) == e_pairFinal;
		}



		public var userData:* = null;
		public var proxy1:b2Proxy;
		public var proxy2:b2Proxy;
		public var next:b2Pair;
		public var status:uint;

		// STATIC
		static public var b2_nullProxy:uint = b2Settings.USHRT_MAX;

		// enum
		static public var e_pairBuffered:uint = 0x0001;
		static public var e_pairRemoved:uint = 0x0002;
		static public var e_pairFinal:uint = 0x0004;

	}
	;


}
