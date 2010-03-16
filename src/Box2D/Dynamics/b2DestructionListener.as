package Box2D.Dynamics{


	import Box2D.Collision.Shapes.*;
	import Box2D.Common.b2internal;
	import Box2D.Dynamics.Joints.*;



	use namespace b2internal;


	/**
	 * Joints and shapes are destroyed when their associated
	 * body is destroyed. Implement this listener so that you
	 * may nullify references to these joints and shapes.
	 */
	public class b2DestructionListener {

		/**
		 * Called when any joint is about to be destroyed due
		 * to the destruction of one of its attached bodies.
		 */
		public virtual function SayGoodbyeJoint(joint:b2Joint):void {
		}



		;

		/**
		 * Called when any shape is about to be destroyed due
		 * to the destruction of its parent body.
		 */
		public virtual function SayGoodbyeShape(shape:b2Shape):void {
		}



		;

	}
	;

}
