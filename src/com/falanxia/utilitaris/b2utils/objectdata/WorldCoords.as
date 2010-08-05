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
	import com.falanxia.utilitaris.helpers.*;



	/**
	 * World coordinates.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class WorldCoords {


		/** X position */
		public var x:Number;

		/** Y position */
		public var y:Number;

		/** Rotation */
		public var rotation:Number;



		/**
		 * Constructor.
		 * @param x X position
		 * @param y Y position
		 * @param rotation Rotation (0 by default)
		 */
		public function WorldCoords(x:Number, y:Number, rotation:Number = 0) {
			this.x = x;
			this.y = y;
			this.rotation = rotation;

			if(isNaN(this.rotation)) this.rotation = 0;
		}



		/**
		 * Multiply by n.
		 * @param n Multiplier
		 */
		public function multiply(n:Number):void {
			x *= n;
			y *= n;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		public function toString():String {
			return printf("x=%.2f, y=%.2f, rotation=%.2f", x, y, rotation);
		}
	}
}
