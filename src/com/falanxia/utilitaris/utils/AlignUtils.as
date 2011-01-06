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

package com.falanxia.utilitaris.utils {
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;



	/**
	 * Align utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class AlignUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function AlignUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Aligns a DisplayObject to the left side of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 * @param outside true to align the DisplayObject to the outside of the bounds, or false to the inside (default false)
		 */
		public static function alignLeft(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true, outside:Boolean = false):void {
			var x:Number = outside ? bounds.left - displayObject.width : bounds.left;
			displayObject.x = snapToPixel ? int(x) : x;
		}



		/**
		 * Aligns a DisplayObject to the right side of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 * @param outside true to align the DisplayObject to the outside of the bounds, or false to the inside (default false)
		 */
		public static function alignRight(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true, outside:Boolean = false):void {
			var x:Number = outside ? bounds.right : bounds.right - displayObject.width;
			displayObject.x = snapToPixel ? int(x) : x;
		}



		/**
		 * Aligns a DisplayObject to the top of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 * @param outside true to align the DisplayObject to the outside of the bounds, or false to the inside (default false)
		 */
		public static function alignTop(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true, outside:Boolean = false):void {
			var y:Number = outside ? bounds.top - displayObject.height : bounds.top;
			displayObject.y = snapToPixel ? int(y) : y;
		}



		/**
		 * Aligns a DisplayObject to the bottom of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 * @param outside true to align the DisplayObject to the outside of the bounds, or false to the inside (default false)
		 */
		public static function alignBottom(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true, outside:Boolean = false):void {
			var y:Number = outside ? bounds.bottom : bounds.bottom - displayObject.height;
			displayObject.y = snapToPixel ? int(y) : y;
		}



		/**
		 * Aligns a DisplayObject to the horizontal center of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 */
		public static function alignCenter(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true):void {
			var centerX:Number = bounds.width * 0.5 - displayObject.width * 0.5 + bounds.x;
			displayObject.x = snapToPixel ? int(centerX) : centerX;
		}



		/**
		 * Aligns a DisplayObject to the vertical middle of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 */
		public static function alignMiddle(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true):void {
			var centerY:Number = bounds.height * 0.5 - displayObject.height * 0.5 + bounds.y;
			displayObject.y = snapToPixel ? int(centerY) : centerY;
		}



		/**
		 * Aligns a DisplayObject to the horizontal center and vertical middle of the bounding Rectangle.
		 * @param displayObject DisplayObject to align
		 * @param bounds Area in which to align the DisplayObject
		 * @param snapToPixel true to force the position to whole pixels, or false to let the DisplayObject be positioned on sub-pixels (default true)
		 */
		public static function alignCenterMiddle(displayObject:DisplayObject, bounds:Rectangle, snapToPixel:Boolean = true):void {
			alignCenter(displayObject, bounds, snapToPixel);
			alignMiddle(displayObject, bounds, snapToPixel);
		}
	}
}
