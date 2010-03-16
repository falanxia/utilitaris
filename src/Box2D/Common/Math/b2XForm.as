package Box2D.Common.Math{








	/**
	 * A transform contains translation and rotation. It is used to represent
	 * the position and orientation of rigid frames.
	 */
	public class b2XForm {
		/**
		 * The default constructor does nothing (for performance).
		 */
		public function b2XForm(pos:b2Vec2 = null, r:b2Mat22 = null):void {
			if(pos) {
				position.SetV(pos);
				R.SetM(r);

			}
		}



		/**
		 * Initialize using a position vector and a rotation matrix.
		 */
		public function Initialize(pos:b2Vec2, r:b2Mat22):void {
			position.SetV(pos);
			R.SetM(r);
		}



		/**
		 * Set this to the identity transform.
		 */
		public function SetIdentity():void {
			position.SetZero();
			R.SetIdentity();
		}



		public function Set(x:b2XForm):void {

			position.SetV(x.position);

			R.SetM(x.R);

		}



		public var position:b2Vec2 = new b2Vec2;
		public var R:b2Mat22 = new b2Mat22();
	}
	;

}
