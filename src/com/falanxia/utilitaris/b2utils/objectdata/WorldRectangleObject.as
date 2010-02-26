/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.b2utils.objectdata {
	import com.falanxia.utilitaris.helpers.printf;



	/**
	 * World rectangle object.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class WorldRectangleObject extends WorldObject {


		public var width:Number;
		public var height:Number;



		public function WorldRectangleObject(name:String, position:WorldCoords, width:Number, height:Number) {
			super(name, position);

			this.width = width;
			this.height = height;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		override public function toString():String {
			return printf("name=%s, position=(%s), width=%.2f, height=%.2f", name, position, width, height);
		}
	}
}
