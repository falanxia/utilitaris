/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.b2utils.objectdata {
	import com.falanxia.utilitaris.helpers.printf;

	import flash.geom.Point;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class WorldPolygonObject extends WorldObject {


		public var vertices:Vector.<WorldCoords>;
		public var center:Point;



		/**
		 * Constructor.
		 */
		public function WorldPolygonObject(name:String, position:WorldCoords, vertices:Vector.<WorldCoords>) {
			super(name, position);

			this.vertices = vertices;
			this.center = new Point(0, 0); // TODO: Add center calculation
		}



		override public function toString():String {
			return printf("name=%s, position=(%s), vertices=", name, position, vertices);
		}
	}
}
