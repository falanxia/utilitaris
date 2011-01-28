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
	 * RGBA data type.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 */
	public final class RGBA {



		/** Red value */
		public var r:uint;

		/** Green value */
		public var g:uint;

		/** Blue value */
		public var b:uint;

		/** Alpha value */
		public var a:uint;



		/**
		 * Constructor.
		 * @param r uint from 0 to 255 representing the red color24 value.
		 * @param g uint from 0 to 255 representing the green color24 value.
		 * @param b uint from 0 to 255 representing the blue color24 value.
		 * @param a uint from 0 to 255 representing the alpha value. Default is 255
		 */
		public final function RGBA(r:uint = 0, g:uint = 0, b:uint = 0, a:uint = 255) {
			this.r = r;
			this.g = g;
			this.b = b;
			this.a = a;
		}



		/**
		 * Sets a 32-bit RGBA color24 value.
		 * Example code:
		 *      <pre>
		 *          var myRGBA:RGBA = new RGBA();
		 *          myRGBA.color32 = 0xFF00FFFF;
		 *          trace("Red = " + myRGBA.r);
		 *          trace("Green = " + myRGBA.g);
		 *          trace("Blue = " + myRGBA.b);
		 *          trace("Alpha = " + myRGBA.a);
		 *      </pre>
		 * @param color 32-bit RGBA color24 value.
		 */
		public final function set color32(color:uint):void {
			//noinspection NonShortCircuitBooleanExpressionJS
			this.a = color >> 24 & 0xFF;

			//noinspection NonShortCircuitBooleanExpressionJS
			this.r = color >> 16 & 0xFF;

			//noinspection NonShortCircuitBooleanExpressionJS
			this.g = color >> 8 & 0xFF;

			//noinspection NonShortCircuitBooleanExpressionJS
			this.b = color & 0xFF;
		}



		/**
		 * Converts to a 32-bit RGBA color24 value.
		 * Example code:
		 *      <pre>
		 *          var myRGBA:RGBA = new RGBA(128, 255, 0, 255);
		 *          var color32:uint = myRGBA.color32;
		 *          trace(color32);
		 *      </pre>
		 * @return Hexidecimal color24 as a String
		 */
		public final function get color32():uint {
			//noinspection NonShortCircuitBooleanExpressionJS
			return(this.a << 24) | (this.r << 16) | (this.g << 8) | this.b;
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
		 * Get alpha as float Number (0..1)
		 * @return alpha as float Number (0..1)
		 */
		public final function get af():Number {
			return 1 / (255 / this.a);
		}



		/**
		 * Get a hexidecimal String representation.
		 * Example code:
		 *      <pre>
		 *          var myRGBA:RGBA = new RGBA(128, 0, 255, 255);
		 *          var hexColor:String = myRGBA.hexString;
		 *          trace(hexColor); // traces 80FF00FF
		 *      </pre>
		 * @return Hexidecimal color24 as a String
		 */
		public final function get hexString():String {
			var aa:String = this.a.toString(16);
			var rr:String = this.r.toString(16);
			var gg:String = this.g.toString(16);
			var bb:String = this.b.toString(16);

			aa = (aa.length == 1) ? "0" + aa : aa;
			rr = (rr.length == 1) ? "0" + rr : rr;
			gg = (gg.length == 1) ? "0" + gg : gg;
			bb = (bb.length == 1) ? "0" + bb : bb;

			return (aa + rr + gg + bb).toUpperCase();
		}
	}
}
