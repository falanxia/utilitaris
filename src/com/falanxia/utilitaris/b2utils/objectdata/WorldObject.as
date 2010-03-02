/*
 * Falanxia Utilitaris.
 *
 * Copyright (c) 2010 Falanxia (http://falanxia.com)
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
	import com.falanxia.utilitaris.helpers.printf;



	/**
	 * World object.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class WorldObject {


		public var position:WorldCoords;
		public var name:String;



		/**
		 * Constructor.
		 * @param name Name
		 * @param position Position as {@code WorldCoords}
		 */
		public function WorldObject(name:String, position:WorldCoords) {
			this.name = name;
			this.position = position;
		}



		/**
		 * Destroys the {@code WorldObject} and frees it for GC.
		 */
		public function destroy():void {
			position = null;
			name = null;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		public function toString():String {
			return printf("name=%s, position=(%s)", name, position);
		}
	}
}
