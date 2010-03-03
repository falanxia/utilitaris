/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.b2utils.objectdata {


	import com.falanxia.utilitaris.helpers.printf;



	/**
	 * World Polygon Object.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class WorldPolygonObject extends WorldObject {


		/** Vertices */
		public var vertices:Vector.<WorldCoords>;



		/**
		 * Constructor.
		 * @param name Name
		 * @param position Position as WorldCoords
		 * @param vertices Vertices as {@code Vector.<WorldCoords>}
		 */
		public function WorldPolygonObject(name:String, position:WorldCoords, vertices:Vector.<WorldCoords>) {
			super(name, position);

			this.vertices = vertices;
		}



		/**
		 * Destroys the {@code WorldPolygonObject} and frees it for GC.
		 */
		override public function destroy():void {
			for(var i:int = 0; i < vertices.length; i++) {
				vertices[i] = null;
			}

			vertices = null;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		override public function toString():String {
			return printf("name=%s, position=(%s), vertices=", name, position, vertices);
		}
	}
}
