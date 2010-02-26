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

package com.falanxia.utilitaris.display {
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 * Scalable {@code Bitmap}.
	 *
	 * @author Didier Brun (<a href="http://www.bytearray.org">bytearray.org</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class ScaleBitmap {



		/**
		 * Draw.
		 * @param bitmap {@code Bitmap} data source
		 * @param graphics Graphics to draw
		 * @param drawRect Draw {@code Rectangle}
		 * @param innerRect Inner {@code Rectangle}
		 * @param outerRect Outer {@code Rectangle}
		 * @todo Optimize (no static)
		 */
		public static function draw(bitmap:BitmapData, graphics:Graphics, drawRect:Rectangle, innerRect:Rectangle,
		                            outerRect:Rectangle = null):void {
			var x:int;
			var y:int;
			var ox:Number = 0;
			var oy:Number;
			var dx:Number = 0;
			var dy:Number;
			var w1:Number;
			var h1:Number;
			var w2:Number;
			var h2:Number;
			var sw:int = bitmap.width;
			var sh:int = bitmap.height;
			var or:Rectangle = outerRect;

			// outer null ?
			if(or == null) or = new Rectangle(0, 0, sw, sh);

			// matrix creation
			var mat:Matrix = new Matrix();

			// pre-calculate widths
			var widths:Array = [innerRect.left, innerRect.width, sw - innerRect.right];

			// pre-calculate heights
			var heights:Array = [innerRect.top, innerRect.height, sh - innerRect.bottom];

			// resized part
			var resize:Point = new Point(drawRect.width - widths[0] - widths[2], drawRect.height - heights[0] - heights[2]);

			// let's draw
			for(x = 0; x < 3; x++) {
				// original width
				w1 = widths[x];

				// draw width
				w2 = x == 1 ? resize.x : widths[x];

				// original & draw offset
				dy = 0;
				oy = 0;

				for(y = 0; y < 3; y++) {
					// original & draw height
					h1 = heights[y];
					h2 = y == 1 ? resize.y : heights[y];

					if(w2 > 0 && h2 > 0) {
						// some matrix computation
						mat.a = w2 / w1;
						mat.d = h2 / h1;
						mat.tx = -ox * mat.a + dx;
						mat.ty = -oy * mat.d + dy;
						mat.translate(-or.left, -or.top);

						// draw the cell
						graphics.beginBitmapFill(bitmap, mat, false, true);
						graphics.drawRect(dx - or.left, dy - or.top, w2, h2);
						graphics.endFill();
					}

					// offset incrementation
					oy += h1;
					dy += h2;
				}

				// offset incrementation
				ox += w1;
				dx += w2;
			}
		}
	}
}
