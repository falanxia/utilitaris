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

package com.falanxia.utilitaris.types {
	import flash.geom.Rectangle;



	/**
	 * Size data type.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public final class Size {



		/** Width */
		public var width:Number;

		/** Height */
		public var height:Number;



		/**
		 * Constructor.
		 * @param width Width
		 * @param height Height
		 */
		public final function Size(width:Number = 0, height:Number = 0) {
			this.width = width;
			this.height = height;
		}



		/**
		 * Convert Size to Rectangle.
		 * @return Rectangle
		 */
		public function get rect():Rectangle {
			return new Rectangle(0, 0, width, height);
		}



		/**
		 * Convert Rectangle to Size
		 * @param value Rectangle
		 */
		public function set rect(value:Rectangle):void {
			width = rect.width;
			height = rect.height;
		}
	}
}
