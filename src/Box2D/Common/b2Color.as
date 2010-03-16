package Box2D.Common{


	import Box2D.Common.Math.*;



	/**
	 * Color for debug drawing. Each value has the range [0,1].
	 */

	public class b2Color {

		public function b2Color(rr:Number, gg:Number, bb:Number) {
			_r = uint(255 * b2Math.b2Clamp(rr, 0.0, 1.0));
			_g = uint(255 * b2Math.b2Clamp(gg, 0.0, 1.0));
			_b = uint(255 * b2Math.b2Clamp(bb, 0.0, 1.0));
		}



		public function Set(rr:Number, gg:Number, bb:Number):void {
			_r = uint(255 * b2Math.b2Clamp(rr, 0.0, 1.0));
			_g = uint(255 * b2Math.b2Clamp(gg, 0.0, 1.0));
			_b = uint(255 * b2Math.b2Clamp(bb, 0.0, 1.0));
		}



		// R
		public function set r(rr:Number):void {
			_r = uint(255 * b2Math.b2Clamp(rr, 0.0, 1.0));
		}



		// G
		public function set g(gg:Number):void {
			_g = uint(255 * b2Math.b2Clamp(gg, 0.0, 1.0));
		}



		// B
		public function set b(bb:Number):void {
			_b = uint(255 * b2Math.b2Clamp(bb, 0.0, 1.0));
		}



		// Color
		public function get color():uint {
			return (_r << 16) | (_g << 8) | (_b);
		}



		private var _r:uint = 0;
		private var _g:uint = 0;
		private var _b:uint = 0;

	}
	;

}
