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



	/**
	 * RGB data type.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 */
	public final class RGB {



		/** Red value */
		public var r:uint;

		/** Green value */
		public var g:uint;

		/** Blue value */
		public var b:uint;



		/**
		 * Constructor.
		 * @param r uint from 0 to 255 representing the red color24 value
		 * @param g uint from 0 to 255 representing the green color24 value
		 * @param b uint from 0 to 255 representing the blue color24 value
		 */
		public final function RGB(r:uint = 0, g:uint = 0, b:uint = 0) {
			this.r = r;
			this.g = g;
			this.b = b;
		}



		/**
		 * Sets a 24-bit RGB color24 value.
		 * Example code:
		 *      <pre>
		 *          var myRGB:RGB = new RGB();
		 *          myRGB.color24 = 0xFF00FF;
		 *          trace("Red = " + myRGB.r);
		 *          trace("Green = " + myRGB.g);
		 *          trace("Blue = " + myRGB.b);
		 *      </pre>
		 * @param color 24-bit RGB color24 value.
		 */
		public final function set color24(color:uint):void {
			//noinspection NonShortCircuitBooleanExpressionJS
			this.r = color >> 16 & 0xFF;

			//noinspection NonShortCircuitBooleanExpressionJS
			this.g = color >> 8 & 0xFF;

			//noinspection NonShortCircuitBooleanExpressionJS
			this.b = color & 0xFF;
		}



		/**
		 * Converts to a 24-bit RGB color24 value.
		 * Example code:
		 *      <pre>
		 *          var myRGBA:RGBA = new RGBA(128, 255, 0, 255);
		 *          var color24:uint = myRGBA.color24;
		 *          trace(color24);
		 *      </pre>
		 * @return Hexidecimal color24 as a String
		 */
		public final function get color24():uint {
			//noinspection NonShortCircuitBooleanExpressionJS
			return(this.r << 16) | (this.g << 8) | this.b;
		}



		/**
		 * Get a hexidecimal String representation.
		 * Example code:
		 *      <pre>
		 *          var myRGB:RGB = new RGB(255, 0, 255);
		 *          var hexColor:String = myRGB.hexString;
		 *          trace(hexColor); // traces FF00FF
		 *      </pre>
		 * @return Hexidecimal color24 as a String
		 */
		public final function get hexString():String {
			var rr:String = this.r.toString(16);
			var gg:String = this.g.toString(16);
			var bb:String = this.b.toString(16);

			rr = (rr.length == 1) ? "0" + rr : rr;
			gg = (gg.length == 1) ? "0" + gg : gg;
			bb = (bb.length == 1) ? "0" + bb : bb;

			return (rr + gg + bb).toUpperCase();
		}
	}
}
