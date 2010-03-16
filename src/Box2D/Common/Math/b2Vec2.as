package Box2D.Common.Math{








	/**
	 * A 2D column vector.
	 */

	public class b2Vec2 {
		public function b2Vec2(x_:Number = 0, y_:Number = 0):void {
			x = x_;
			y = y_;
		}



		;

		public function SetZero():void {
			x = 0.0;
			y = 0.0;
		}



		public function Set(x_:Number = 0, y_:Number = 0):void {
			x = x_;
			y = y_;
		}



		;
		public function SetV(v:b2Vec2):void {
			x = v.x;
			y = v.y;
		}



		;

		public function Negative():b2Vec2 {
			return new b2Vec2(-x, -y);
		}



		static public function Make(x_:Number, y_:Number):b2Vec2 {
			return new b2Vec2(x_, y_);
		}



		public function Copy():b2Vec2 {
			return new b2Vec2(x, y);
		}



		public function Add(v:b2Vec2):void {
			x += v.x;
			y += v.y;
		}



		public function Subtract(v:b2Vec2):void {
			x -= v.x;
			y -= v.y;
		}



		public function Multiply(a:Number):void {
			x *= a;
			y *= a;
		}



		public function MulM(A:b2Mat22):void {
			var tX:Number = x;
			x = A.col1.x * tX + A.col2.x * y;
			y = A.col1.y * tX + A.col2.y * y;
		}



		public function MulTM(A:b2Mat22):void {
			var tX:Number = b2Math.b2Dot(this, A.col1);
			y = b2Math.b2Dot(this, A.col2);
			x = tX;
		}



		public function CrossVF(s:Number):void {
			var tX:Number = x;
			x = s * y;
			y = -s * tX;
		}



		public function CrossFV(s:Number):void {
			var tX:Number = x;
			x = -s * y;
			y = s * tX;
		}



		public function MinV(b:b2Vec2):void {
			x = x < b.x ? x : b.x;
			y = y < b.y ? y : b.y;
		}



		public function MaxV(b:b2Vec2):void {
			x = x > b.x ? x : b.x;
			y = y > b.y ? y : b.y;
		}



		public function Abs():void {
			if(x < 0) x = -x;
			if(y < 0) y = -y;
		}



		public function Length():Number {
			return Math.sqrt(x * x + y * y);
		}



		public function LengthSquared():Number {
			return (x * x + y * y);
		}



		public function Normalize():Number {
			var length:Number = Math.sqrt(x * x + y * y);
			if(length < Number.MIN_VALUE) {
				return 0.0;
			}
			var invLength:Number = 1.0 / length;
			x *= invLength;
			y *= invLength;

			return length;
		}



		public function IsValid():Boolean {
			return b2Math.b2IsValid(x) && b2Math.b2IsValid(y);
		}



		public var x:Number;
		public var y:Number;
	}
	;

}
