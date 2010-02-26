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



	/**
	 * Conversion utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class ConversionUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function ConversionUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Converts bits to bytes.
		 * @param bits {@code Number} of bits
		 * @return {@code Number} of bytes
		 */
		public static function bitsToBytes(bits:Number):Number {
			return bits >> 3;
		}



		/**
		 * Converts bits to kilobits.
		 * @param bits {@code Number} of bits
		 * @return {@code Number} of kilobits
		 */
		public static function bitsToKilobits(bits:Number):Number {
			return bits >> 10;
		}



		/**
		 * Converts bits to kilobytes.
		 * @param bits {@code Number} of bits
		 * @return {@code Number} of kilobits
		 */
		public static function bitsToKilobytes(bits:Number):Number {
			return bits >> 11;
		}



		/**
		 * Converts bytes to bits.
		 * @param bytes {@code Number} of bytes
		 * @return {@code Number} of bits
		 */
		public static function bytesToBits(bytes:Number):Number {
			return bytes << 3;
		}



		/**
		 * Converts bytes to kilobits.
		 * @param bytes {@code Number} of bytes
		 * @return {@code Number} of kilobits
		 */
		public static function bytesToKilobits(bytes:Number):Number {
			return bytes >> 7;
		}



		/**
		 * Converts bytes to kilobytes.
		 * @param bytes {@code Number} of bytes
		 * @return {@code Number} of kilobytes
		 */
		public static function bytesToKilobytes(bytes:Number):Number {
			return bytes >> 10;
		}



		/**
		 * Converts kilobits to bits.
		 * @param kilobits {@code Number} of kilobits
		 * @return {@code Number} of bits
		 */
		public static function kilobitsToBits(kilobits:Number):Number {
			return kilobits << 10;
		}



		/**
		 * Converts kilobits to bytes.
		 * @param kilobits {@code Number} of kilobits
		 * @return {@code Number} of bytes
		 */
		public static function kilobitsToBytes(kilobits:Number):Number {
			return kilobits << 7;
		}



		/**
		 * Converts kilobits to kilobytes.
		 * @param kilobits {@code Number} of kilobits
		 * @return {@code Number} of kilobytes
		 */
		public static function kilobitsToKilobytes(kilobits:Number):Number {
			return kilobits >> 3;
		}



		/**
		 * Converts kilobytes to bits.
		 * @param kilobytes {@code Number} of kilobytes
		 * @return {@code Number} of bits
		 */
		public static function kilobytesToBits(kilobytes:Number):Number {
			return kilobytes << 13;
		}



		/**
		 * Converts kilobytes to bytes.
		 * @param kilobytes {@code Number} of kilobytes
		 * @return {@code Number} of bytes
		 */
		public static function kilobytesToBytes(kilobytes:Number):Number {
			return kilobytes << 10;
		}



		/**
		 * Converts kilobytes to kilobits.
		 * @param kilobytes {@code Number} of kilobytes
		 * @return {@code Number} of kilobits
		 */
		public static function kilobytesToKilobits(kilobytes:Number):Number {
			return kilobytes << 3;
		}



		/**
		 * Converts milliseconds to seconds.
		 * @param milliseconds {@code Number} of milliseconds
		 * @return {@code Number} of seconds
		 */
		public static function millisecondsToSeconds(milliseconds:Number):Number {
			return milliseconds / 1000;
		}



		/**
		 * Converts milliseconds to minutes.
		 * @param milliseconds {@code Number} of milliseconds
		 * @return {@code Number} of minutes
		 */
		public static function millisecondsToMinutes(milliseconds:Number):Number {
			return secondsToMinutes(millisecondsToSeconds(milliseconds));
		}



		/**
		 * Converts milliseconds to hours.
		 * @param milliseconds {@code Number} of milliseconds
		 * @return {@code Number} of hours
		 */
		public static function millisecondsToHours(milliseconds:Number):Number {
			return minutesToHours(millisecondsToMinutes(milliseconds));
		}



		/**
		 * Converts milliseconds to days.
		 * @param milliseconds {@code Number} of milliseconds
		 * @return {@code Number} of days
		 */
		public static function millisecondsToDays(milliseconds:Number):Number {
			return hoursToDays(millisecondsToHours(milliseconds));
		}



		/**
		 * Converts seconds to milliseconds.
		 * @param seconds {@code Number} of seconds
		 * @return {@code Number} of milliseconds
		 */
		public static function secondsToMilliseconds(seconds:Number):Number {
			return seconds * 1000;
		}



		/**
		 * Converts seconds to minutes.
		 * @param seconds {@code Number} of seconds
		 * @return {@code Number} of minutes
		 */
		public static function secondsToMinutes(seconds:Number):Number {
			return seconds / 60;
		}



		/**
		 * Converts seconds to hours.
		 * @param seconds {@code Number} of seconds
		 * @return {@code Number} of hours
		 */
		public static function secondsToHours(seconds:Number):Number {
			return minutesToHours(secondsToMinutes(seconds));
		}



		/**
		 * Converts seconds to days.
		 * @param seconds {@code Number} of seconds
		 * @return {@code Number} of days
		 */
		public static function secondsToDays(seconds:Number):Number {
			return hoursToDays(secondsToHours(seconds));
		}



		/**
		 * Converts minutes to milliseconds.
		 * @param minutes {@code Number} of minutes
		 * @return {@code Number} of milliseconds
		 */
		public static function minutesToMilliseconds(minutes:Number):Number {
			return secondsToMilliseconds(minutesToSeconds(minutes));
		}



		/**
		 * Converts minutes to seconds.
		 * @param minutes {@code Number} of minutes
		 * @return {@code Number} of seconds
		 */
		public static function minutesToSeconds(minutes:Number):Number {
			return minutes * 60;
		}



		/**
		 * Converts minutes to hours.
		 * @param minutes {@code Number} of minutes
		 * @return {@code Number} of hours
		 */
		public static function minutesToHours(minutes:Number):Number {
			return minutes / 60;
		}



		/**
		 * Converts minutes to days.
		 * @param minutes {@code Number} of minutes
		 * @return {@code Number} of days
		 */
		public static function minutesToDays(minutes:Number):Number {
			return hoursToDays(minutesToHours(minutes));
		}



		/**
		 * Converts hours to milliseconds.
		 * @param hours {@code Number} of hours
		 * @return {@code Number} of milliseconds
		 */
		public static function hoursToMilliseconds(hours:Number):Number {
			return secondsToMilliseconds(hoursToSeconds(hours));
		}



		/**
		 * Converts hours to seconds.
		 * @param hours {@code Number} of hours
		 * @return {@code Number} of seconds
		 */
		public static function hoursToSeconds(hours:Number):Number {
			return minutesToSeconds(hoursToMinutes(hours));
		}



		/**
		 * Converts hours to minutes.
		 * @param hours {@code Number} of hours
		 * @return {@code Number} of minutes
		 */
		public static function hoursToMinutes(hours:Number):Number {
			return hours * 60;
		}



		/**
		 * Converts hours to days.
		 * @param hours {@code Number} of hours
		 * @return {@code Number} of days
		 */
		public static function hoursToDays(hours:Number):Number {
			return hours / 24;
		}



		/**
		 * Converts days to milliseconds.
		 * @param days {@code Number} of days
		 * @return {@code Number} of milliseconds
		 */
		public static function daysToMilliseconds(days:Number):Number {
			return secondsToMilliseconds(daysToSeconds(days));
		}



		/**
		 * Converts days to seconds.
		 * @param days {@code Number} of days
		 * @return {@code Number} of seconds
		 */
		public static function daysToSeconds(days:Number):Number {
			return minutesToSeconds(daysToMinutes(days));
		}



		/**
		 * Converts days to minutes.
		 * @param days {@code Number} of days
		 * @return {@code Number} of minutes
		 */
		public static function daysToMinutes(days:Number):Number {
			return hoursToMinutes(daysToHours(days));
		}



		/**
		 * Converts days to hours.
		 * @param days {@code Number} of days
		 * @return {@code Number} of hours
		 */
		public static function daysToHours(days:Number):Number {
			return days * 24;
		}



		/**
		 * Converts degrees to radians.
		 * @param degrees {@code Number} of degrees
		 * @return {@code Number} of radians
		 */
		public static function degreesToRadians(degrees:Number):Number {
			return degrees * (Math.PI / 180);
		}



		/**
		 * Converts radians to degrees.
		 * @param radians {@code Number} of radians
		 * @return {@code Number} of degrees
		 */
		public static function radiansToDegrees(radians:Number):Number {
			return radians * (180 / Math.PI);
		}
	}
}
