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

package com.falanxia.utilitaris.utils {
	import flash.display.*;
	import flash.geom.*;



	/**
	 * Bitmap utilities.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public final class BitmapUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function BitmapUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Get {@code BitmapData} from the {@code source}.
		 * If {@code source} is {@code Bitmap}, it's converted, if it is already {@code BitmapData}, reference is returned.
		 * Serves as a quick filter for {@code Bitmap} and {@code BitmapData}.
		 * @param source Source {@code Bitmap} or {@code BitmapData}
		 * @return {@code source} converted to {@code BitmapData}
		 * @throws {@code TypeError} if the source is not {@code Bitmap} nor {@code BitmapData}
		 */
		public static function embed2BD(source:*):BitmapData {
			var o:BitmapData;

			if(source is Bitmap) {
				o = source.bitmapData;
			}
			else {
				if(source is BitmapData) {
					o = source;
				}
				else {
					throw new TypeError("Bitmap or BitmapData needed");
				}
			}

			return o;
		}



		/**
		 * Crop the {@code BitmapData} {@code source} and return a new {@code BitmapData}.
		 * @param source Source {@code BitmapData}
		 * @param dest Crop area as {@code Rectangle}
		 * @return Cropped {@code source} as {@code BitmapData}
		 */
		public static function crop(source:BitmapData, dest:Rectangle):BitmapData {
			var o:BitmapData = new BitmapData(dest.width, dest.height);
			var point:Point = new Point(0, 0);

			o.copyPixels(source, dest, point);

			return o;
		}
	}
}
