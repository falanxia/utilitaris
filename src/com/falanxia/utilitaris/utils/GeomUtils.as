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
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 * Align utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Nemo design (<a href="http://nemodesign.com">nemodesign.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class GeomUtils {



		/** Pre-calcuated value of Math.PI, don't use in bottlenecks */
		public static var PI:Number = 3.141592653589793;

		/** Pre-calcuated value of (Math.PI/180), don't use in bottlenecks */
		public static var PI_OVER_180:Number = 0.017453292519943295;



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function GeomUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Rotates a {@code Point} around another {@code Point} by the specified angle.
		 * @param point {@code Point} to rotate
		 * @param centerPoint {@code Point} to rotate this {@code Point} around
		 * @param angle Angle (in degrees) to rotate this {@code Point}
		 * @todo Optimize for faster access (no static)
		 */
		public static function rotatePoint(point:Point, centerPoint:Point, angle:Number):void {
			var radians:Number = ConversionUtils.degreesToRadians(angle);
			var baseX:Number = point.x - centerPoint.x;
			var baseY:Number = point.y - centerPoint.y;

			point.x = (Math.cos(radians) * baseX) - (Math.sin(radians) * baseY) + centerPoint.x;
			point.y = (Math.sin(radians) * baseX) + (Math.cos(radians) * baseY) + centerPoint.y;
		}



		/**
		 * Determines the angle/degree between the first and second {@code Point}s.
		 * @param first First {@code Point}
		 * @param second Second {@code Point}
		 * @return Degree between the two {@code Point}s
		 * @todo Optimize for faster access (no static)
		 */
		public static function angle(first:Point, second:Point):Number {
			return Math.atan2(second.y - first.y, second.x - first.x) / (Math.PI / 180);
		}



		/**
		 * Calculates the perimeter of a {@code Rectangle}.
		 * @param rect {@code Rectangle} to determine the perimeter of
		 * @todo Optimize for faster access (no static)
		 */
		public static function getRectanglePerimeter(rect:Rectangle):Number {
			return rect.width * 2 + rect.height * 2;
		}



		/**
		 * Converts the supplied {@code degrees} to {@code radians}.
		 * @param degrees Degrees to be converted to {@code radians}
		 * @return Supplied {@code degrees} converted to {@code radians}
		 * @todo Optimize for faster access (no static)
		 */
		public static function degreesToRadians(degrees:Number):Number {
			return degrees * PI_OVER_180;
		}



		/**
		 * Converts the supplied {@code radians} represented as {@code degrees}.
		 * @param radians Radians to be converted to {@code degrees}
		 * @return {@code Radians} converted to {@code degrees}
		 * @todo Optimize for faster access (no static)
		 */
		public static function radiansToDegrees(radians:Number):Number {
			return radians / PI_OVER_180;
		}



		/**
		 * Simplifys the supplied {@code angle} to its simpliest representation.
		 * @param angle Angle to simplify
		 * @return Supplied {@code angle} simplified
		 * @example
		 *      <code>
		 *          var simpAngle:Number = MathUtils.simplifyAngle(725); // returns 5
		 *          var simpAngle2:Number = MathUtils.simplifyAngle(-725); // returns -5
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function simplifyAngle(angle:Number):Number {
			var _rotations:Number = Math.floor(angle / 360);

			return (angle >= 0) ? angle - (360 * _rotations) : angle + (360 * _rotations);
		}
	}
}
