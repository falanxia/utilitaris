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
	import com.falanxia.utilitaris.types.Percent;

	import flash.geom.ColorTransform;



	/**
	 * Color utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Five3D (<a href="http://five3d.mathieu-badimon.com">five3d.mathieu-badimon.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura / Falanxia a.s.
	 * @see RGB
	 * @see RGBA
	 */
	public class ColorUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function ColorUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Interpolates (tints) between two colors.
		 * Example code:
		 *      <pre>
		 *          var myColor:ColorTransform = new ColorTransform();
		 *          myColor.color24 = 0xFF0000;
		 *          var box:Sprite = new Sprite();
		 *          box.graphics.beginFill(0x0000FF);
		 *          box.graphics.drawRect(10, 10, 250, 250);
		 *          box.graphics.endFill();
		 *          box.transform.colorTransform = ColorUtils.interpolateColor(new ColorTransform(), myColor, new Percent(0.5));
		 *          this.addChild(box);
		 *      </pre>
		 * @param begin Start color24
		 * @param end End color24
		 * @param amount Level of interpolation between begin and end colors
		 * @return New interpolated color24
		 */
		public static function interpolateColor(begin:ColorTransform, end:ColorTransform, amount:Percent):ColorTransform {
			var interpolation:ColorTransform = new ColorTransform();

			interpolation.redMultiplier = NumberUtils.interpolate(amount, begin.redMultiplier, end.redMultiplier);
			interpolation.greenMultiplier = NumberUtils.interpolate(amount, begin.greenMultiplier, end.greenMultiplier);
			interpolation.blueMultiplier = NumberUtils.interpolate(amount, begin.blueMultiplier, end.blueMultiplier);
			interpolation.alphaMultiplier = NumberUtils.interpolate(amount, begin.alphaMultiplier, end.alphaMultiplier);
			interpolation.redOffset = NumberUtils.interpolate(amount, begin.redOffset, end.redOffset);
			interpolation.greenOffset = NumberUtils.interpolate(amount, begin.greenOffset, end.greenOffset);
			interpolation.blueOffset = NumberUtils.interpolate(amount, begin.blueOffset, end.blueOffset);
			interpolation.alphaOffset = NumberUtils.interpolate(amount, begin.alphaOffset, end.alphaOffset);

			return interpolation;
		}



		/**
		 * Adjust color24 brightness.
		 * @param colortransform Color transform matrix as ColorTransform
		 * @param value Value of adjustment
		 */
		public static function setBrightness(colortransform:ColorTransform, value:Number):void {
			var v:Number = value;

			if(value > 1) {
				v = 1;
			} else if(value < -1) {
				v = -1;
			}

			var percent:Number = 1 - Math.abs(v);
			var offset:Number = 0;

			if(v > 0) offset = v * 255;

			colortransform.redMultiplier = percent;
			colortransform.greenMultiplier = percent;
			colortransform.blueMultiplier = percent;

			colortransform.redOffset = offset;
			colortransform.greenOffset = offset;
			colortransform.blueOffset = offset;
		}
	}
}
