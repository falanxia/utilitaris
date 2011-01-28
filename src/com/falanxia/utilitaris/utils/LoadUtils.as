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



	/**
	 * Load utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura / Falanxia a.s.
	 */
	public class LoadUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function LoadUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Calculates the load speed in bytes per second (Bps).
		 * This method returns <strong>bytes</strong> per second, not bits per second.
		 * @param bytesLoaded Number of bytes that have loaded between startTime and elapsedTime
		 * @param startTime Time in milliseconds when the load started
		 * @param elapsedTime Time in milliseconds since the load started or time when load completed
		 * @return Bytes per second
		 */
		public static function calculateBps(bytesLoaded:uint, startTime:uint, elapsedTime:uint):int {
			return Math.max(0, (bytesLoaded / ConversionUtils.millisecondsToSeconds(elapsedTime - startTime)));
		}



		/**
		 * Calculates the load speed in kilobytes per second (kBps).
		 * This method returns <strong>kiloBYTES</strong> per second, not kilobits per second.
		 * @param bytesLoaded Number of bytes that have loaded between startTime and elapsedTime
		 * @param startTime Time in milliseconds when the load started
		 * @param elapsedTime Time in milliseconds since the load started or time when load completed
		 * @return Kilobytes per second
		 */
		public static function calculateKBps(bytesLoaded:uint, startTime:uint, elapsedTime:uint):Number {
			return ConversionUtils.bytesToKilobytes(calculateBps(bytesLoaded, startTime, elapsedTime));
		}



		/**
		 * Calculates the percent the video has buffered.
		 * @param bytesLoaded Number of bytes that have loaded between startTime and elapsedTime
		 * @param bytesTotal Number of bytes total to be loaded
		 * @param startTime Time in milliseconds when the load started
		 * @param elapsedTime Current time in milliseconds or time when load completed
		 * @param lengthInMilliseconds Total duration/length of the video in milliseconds
		 * @return Percent buffered
		 * @see Percent
		 */
		public static function calculateBufferPercent(bytesLoaded:uint, bytesTotal:uint, startTime:uint, elapsedTime:uint,
		                                              lengthInMilliseconds:uint):Percent {
			var totalWait:Number = bytesTotal / (bytesLoaded / (elapsedTime - startTime)) - lengthInMilliseconds;
			var millisecondsRemaining:uint = calculateMillisecondsUntilBuffered(bytesLoaded, bytesTotal, startTime, elapsedTime, lengthInMilliseconds);

			//noinspection ConditionalExpressionWithIdenticalBranchesJS
			return (totalWait == Number.POSITIVE_INFINITY) ? new Percent(0) : new Percent(NumberUtils.confine(1 - millisecondsRemaining / totalWait, 0, 1));
		}



		/**
		 * Calculates the remaining time until the video is buffered.
		 * @param bytesLoaded Number of bytes that have loaded between startTime and elapsedTime.
		 * @param bytesTotal Number of bytes total to be loaded
		 * @param startTime Time in milliseconds when the load started
		 * @param elapsedTime Current time in milliseconds or time when load completed
		 * @param lengthInMilliseconds Total duration/length of the video in milliseconds
		 * @return Amount millisecond that remain before the video is buffered
		 */
		public static function calculateMillisecondsUntilBuffered(bytesLoaded:uint, bytesTotal:uint, startTime:uint, elapsedTime:uint,
		                                                          lengthInMilliseconds:uint):uint {
			return Math.max(Math.ceil((bytesTotal - bytesLoaded) / (bytesLoaded / (elapsedTime - startTime))) - lengthInMilliseconds, 0);
		}
	}
}
