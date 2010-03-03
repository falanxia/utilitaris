/*
 * Copyright (c) 2010 Jakub Schimer @ falanxia a.s.  <jakub.schimer@falanxia.com>
 */

package com.falanxia.utilitaris.b2utils.objectdata {


	import com.falanxia.utilitaris.helpers.printf;



	/**
	 * World circle object.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class WorldCircleObject extends WorldObject {


		/** Radius */
		public var radius:Number;



		/**
		 * Constructor.
		 * @param name Name
		 * @param position Position
		 * @param radius Radius
		 */
		public function WorldCircleObject(name:String, position:WorldCoords, radius:Number) {
			super(name, position);

			this.radius = radius;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		override public function toString():String {
			return printf("name=%s, position=(%s), radius=%.2f", name, position, radius);
		}
	}
}
