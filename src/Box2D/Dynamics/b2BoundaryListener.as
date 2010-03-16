package Box2D.Dynamics{


	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * This is called when a body's shape passes outside of the world boundary.
	 */
	public class b2BoundaryListener {

		/**
		 * This is called for each body that leaves the world boundary.
		 * @warning you can't modify the world inside this callback.
		 */
		public virtual function Violation(body:b2Body):void {
		}



		;

	}
	;

}
