package Box2D.Common.Math{








	/**
	 * A 2D column vector with 3 elements.
	 */

	public class b2Vec3 {
		/**
		 * Construct using co-ordinates
		 */
		public function b2Vec3(x:Number = 0, y:Number = 0, z:Number = 0) {
			this.x = x;
			this.y = y;
			this.z = z;
		}



		/**
		 * Sets this vector to all zeros
		 */
		public function SetZero():void {
			x = y = z = 0.0;
		}



		/**
		 * Set this vector to some specified coordinates.
		 */
		public function Set(x:Number, y:Number, z:Number):void {
			this.x = x;
			this.y = y;
			this.z = z;
		}



		public function SetV(v:b2Vec3):void {
			x = v.x;
			y = v.y;
			z = v.z;
		}



		/**
		 * Negate this vector
		 */
		public function Negative():b2Vec3 {
			return new b2Vec3(-x, -y, -z);
		}



		public function Copy():b2Vec3 {
			return new b2Vec3(x, y, z);
		}



		public function Add(v:b2Vec3):void {
			x += v.x;
			y += v.y;
			z += v.z;
		}



		public function Subtract(v:b2Vec3):void {
			x -= v.x;
			y -= v.y;
			z -= v.z;
		}



		public function Multiply(a:Number):void {
			x *= a;
			y *= a;
			z *= a;
		}



		public var x:Number;
		public var y:Number;
		public var z:Number;

	}
}
