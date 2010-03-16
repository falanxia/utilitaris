package Box2D.Dynamics.Joints{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * @private
	 */
	public class b2Jacobian {
		public var linear1:b2Vec2 = new b2Vec2();
		public var angular1:Number;
		public var linear2:b2Vec2 = new b2Vec2();
		public var angular2:Number;



		public function SetZero():void {
			linear1.SetZero();
			angular1 = 0.0;
			linear2.SetZero();
			angular2 = 0.0;
		}



		public function Set(x1:b2Vec2, a1:Number, x2:b2Vec2, a2:Number):void {
			linear1.SetV(x1);
			angular1 = a1;
			linear2.SetV(x2);
			angular2 = a2;
		}



		public function Compute(x1:b2Vec2, a1:Number, x2:b2Vec2, a2:Number):Number {

			//return b2Math.b2Dot(linear1, x1) + angular1 * a1 + b2Math.b2Dot(linear2, x2) + angular2 * a2;
			return (linear1.x * x1.x + linear1.y * x1.y) + angular1 * a1 + (linear2.x * x2.x + linear2.y * x2.y) + angular2 * a2;
		}
	}
	;


}
