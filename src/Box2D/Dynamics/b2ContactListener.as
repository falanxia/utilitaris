package Box2D.Dynamics{


	import Box2D.Collision.*;
	import Box2D.Common.b2internal;
	import Box2D.Dynamics.Contacts.*;



	use namespace b2internal;


	/**
	 * Implement this class to get collision results. You can use these results for
	 * things like sounds and game logic. You can also get contact results by
	 * traversing the contact lists after the time step. However, you might miss
	 * some contacts because continuous physics leads to sub-stepping.
	 * Additionally you may receive multiple callbacks for the same contact in a
	 * single time step.
	 * You should strive to make your callbacks efficient because there may be
	 * many callbacks per time step.
	 * @warning The contact separation is the last computed value.
	 * @warning You cannot create/destroy Box2D entities inside these callbacks.
	 */
	public class b2ContactListener {

		/**
		 * Called when a contact point is added. This includes the geometry
		 * and the forces.
		 */
		public virtual function Add(point:b2ContactPoint):void {
		}



		;

		/**
		 * Called when a contact point persists. This includes the geometry
		 * and the forces.
		 */
		public virtual function Persist(point:b2ContactPoint):void {
		}



		;

		/**
		 * Called when a contact point is removed. This includes the last
		 * computed geometry and forces.
		 */
		public virtual function Remove(point:b2ContactPoint):void {
		}



		;

		/**
		 * Called after a contact point is solved.
		 */
		public virtual function Result(point:b2ContactResult):void {
		}



		;
	}
	;

}
