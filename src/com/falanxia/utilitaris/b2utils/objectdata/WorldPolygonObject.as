/*
 * Falanxia Utilitaris.
 *
 * Copyright (c) 2011 Falanxia (http://falanxia.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.falanxia.utilitaris.b2utils.objectdata {



	/**
	 * World polygon object.
	 *
	 * @author Jakub Schimer / Falanxia a.s.
	 * @author Vaclav Vancura / Falanxia a.s.
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class WorldPolygonObject extends WorldObject {


		/** Vertices */
		public var vertices:Vector.<WorldCoords>;



		/**
		 * Constructor.
		 * @param name Name
		 * @param position Position as WorldCoords
		 * @param vertices Vertices as Vector.<WorldCoords>
		 */
		public function WorldPolygonObject(name:String, position:WorldCoords, vertices:Vector.<WorldCoords>) {
			super(name, position);

			this.vertices = vertices;
		}



		/**
		 * Destructor.
		 */
		override public function destroy():void {
			if(vertices == null) return;

			for(var i:int = 0; i < vertices.length; i++) vertices[i] = null;

			vertices = null;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		override public function toString():String {
			var f:String = "";

			for each(var v:WorldCoords in vertices) f += "(" + v.toString() + "), ";
			f = f.substr(0, f.length - 2);

			return "name='" + name + "', position=(" + position.toString() + "), vertices=(" + f + ")";
		}
	}
}
