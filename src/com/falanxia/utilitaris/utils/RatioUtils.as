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
	import com.falanxia.utilitaris.types.Percent;

	import flash.geom.Rectangle;



	/**
	 * Ratio utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class RatioUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function RatioUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Determines the ratio of {@code width} to {@code height}.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @todo Optimize for faster access (no static)
		 */
		public static function widthToHeight(rect:Rectangle):Number {
			return rect.width / rect.height;
		}



		/**
		 * Determines the ratio of {@code height} to {@code width}.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @todo Optimize for faster access (no static)
		 */
		public static function heightToWidth(rect:Rectangle):Number {
			return rect.height / rect.width;
		}



		/**
		 * Scales an area's {@code width} and {@code height} while preserving aspect ratio.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param amount Amount you wish to scale by
		 * @param snapToPixel {@code true} to force the scale to whole pixels, or {@code false} to allow sub-pixels
		 * @todo Optimize for faster access (no static)
		 */
		public static function scale(rect:Rectangle, amount:Percent, snapToPixel:Boolean = true):Rectangle {
			return _defineRect(rect, rect.width * amount.decimalPercentage, rect.height * amount.decimalPercentage, snapToPixel);
		}



		/**
		 * Scales the {@code width} of an area while preserving aspect ratio.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param height Height to scale to
		 * @param snapToPixel {@code true} to force the scale to whole pixels, or {@code false} to allow sub-pixels
		 * @todo Optimize for faster access (no static)
		 */
		public static function scaleWidth(rect:Rectangle, height:Number, snapToPixel:Boolean = true):Rectangle {
			return _defineRect(rect, height * widthToHeight(rect), height, snapToPixel);
		}



		/**
		 * Scales the {@code height} of an area while preserving aspect ratio.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param width Width to scale to
		 * @param snapToPixel {@code true} to force the scale to whole pixels, or {@code false} to allow sub-pixels
		 * @todo Optimize for faster access (no static)
		 */
		public static function scaleHeight(rect:Rectangle, width:Number, snapToPixel:Boolean = true):Rectangle {
			return _defineRect(rect, width, width * heightToWidth(rect), snapToPixel);
		}



		/**
		 * Resizes an area to fill the bounding area while preserving aspect ratio.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param bounds Area to fill - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param snapToPixel {@code true} to force the scale to whole pixels, or {@code false} to allow sub-pixels
		 * @todo Optimize for faster access (no static)
		 */
		public static function scaleToFill(rect:Rectangle, bounds:Rectangle, snapToPixel:Boolean = true):Rectangle {
			var scaled:Rectangle = scaleHeight(rect, bounds.width, snapToPixel);

			if(scaled.height < bounds.height) scaled = scaleWidth(rect, bounds.height, snapToPixel);

			return scaled;
		}



		/**
		 * Resizes an area to the maximum size of a bounding area without exceeding while preserving aspect ratio.
		 * @param rect Area's {@code width} and {@code height} expressed as a {@code Rectangle} - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param bounds Area the rectangle needs to fit within - the {@code Rectangle}'s {@code x} and {@code y} values are ignored
		 * @param snapToPixel {@code true} to force the scale to whole pixels, or {@code false} to allow sub-pixels
		 */
		public static function scaleToFit(rect:Rectangle, bounds:Rectangle, snapToPixel:Boolean = true):Rectangle {
			var scaled:Rectangle = scaleHeight(rect, bounds.width, snapToPixel);

			if(scaled.height > bounds.height) scaled = scaleWidth(rect, bounds.height, snapToPixel);

			return scaled;
		}



		/* ★ PRIVATE METHODS ★ */


		protected static function _defineRect(size:Rectangle, width:Number, height:Number, snapToPixel:Boolean):Rectangle {
			var scaled:Rectangle = size.clone();

			scaled.width = snapToPixel ? Math.round(width) : width;
			scaled.height = snapToPixel ? Math.round(height) : height;

			return scaled;
		}
	}
}
