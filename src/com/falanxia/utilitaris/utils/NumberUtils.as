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



	/**
	 * Number utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Jonnie Hallman / Destroytoday (<a href="http://destroytoday.com">destroytoday.com</a>)
	 * @author Nemo design (<a href="http://nemodesign.com">nemodesign.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class NumberUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function NumberUtils() {
			throw new Error('The class cannot be instantiated');
		}



		/**
		 * Determines if the two {@code value}s are equal, with the option to define the {@code precision}.
		 * @param val1 A value to compare
		 * @param val2 A value to compare
		 * @param precision Maximum amount the two values can differ and still be considered equal
		 * @return {@code true} if the values are equal
		 * @example
		 *      <code>
		 *          trace(NumberUtils.isEqual(3.042, 3, 0)); // traces false
		 *          trace(NumberUtils.isEqual(3.042, 3, 0.5)); // traces true
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function isEqual(val1:Number, val2:Number, precision:Number = 0):Boolean {
			return Math.abs(val1 - val2) <= Math.abs(precision);
		}



		/**
		 * Evaluates {@code val1} and {@code val2} and returns the smaller value. Unlike {@code Math.min} this method
		 * will return the defined value if the other value is {@code null} or not a {@code Number}.
		 * @param val1 A value to compare
		 * @param val2 A value to compare
		 * @return Smallest value, or the value out of the two that is defined and valid
		 * @example
		 *      <code>
		 *          trace(NumberUtils.min(5, null)); // traces 5
		 *          trace(NumberUtils.min(5, "CASA")); // traces 5
		 *          trace(NumberUtils.min(5, 13)); // traces 5
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		//noinspection FunctionWithMultipleReturnPointsJS
		public static function min(val1:*, val2:*):Number {
			if(isNaN(val1) && isNaN(val2) || val1 == null && val2 == null) {
				return NaN;
			}

			if(val1 == null || val2 == null) {
				return (val2 == null) ? val1 : val2;
			}

			if(isNaN(val1) || isNaN(val2)) {
				return isNaN(val2) ? val1 : val2;
			}

			return Math.min(val1, val2);
		}



		/**
		 * Evaluates {@code val1} and {@code val2} and returns the larger value. Unlike {@code Math.max} this method
		 * will return the defined value if the other value is {@code null} or not a number.
		 * @param val1 A value to compare
		 * @param val2 A value to compare
		 * @return Largest value, or the value out of the two that is defined and valid
		 * @example
		 *      <code>
		 *          trace(NumberUtils.max(-5, null)); // traces -5
		 *          trace(NumberUtils.max(-5, "CASA")); // traces -5
		 *          trace(NumberUtils.max(-5, -13)); // traces -5
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function max(val1:*, val2:*):Number {
			var out:Number;

			//noinspection OverlyComplexBooleanExpressionJS
			if(isNaN(val1) && isNaN(val2) || val1 == null && val2 == null) {
				out = NaN;
			}

			else if(val1 == null || val2 == null) {
				out = (val2 == null) ? val1 : val2;
			}

			else if(isNaN(val1) || isNaN(val2)) {
				out = (isNaN(val2)) ? val1 : val2;
			}

			else {
				out = Math.max(val1, val2);
			}

			return out;
		}



		/**
		 * Determines if the {@code Number} is even.
		 * @param value A {@code Number} to determine if it is divisible by {@code 2}
		 * @return {@code true} if the {@code Number} is even
		 * @example
		 *      <code>
		 *          trace(NumberUtils.isEven(7)); // traces false
		 *          trace(NumberUtils.isEven(12)); // traces true
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function isEven(value:Number):Boolean {
			//noinspection NonShortCircuitBooleanExpressionJS
			return(value & 1) == 0;
		}



		/**
		 * Determines if the {@code Number} is odd.
		 * @param value A {@code Number} to determine if it is not divisible by {@code 2}
		 * @return {@code true} if the {@code Number} is odd
		 * @example
		 *      <code>
		 *          trace(NumberUtils.isOdd(7)); // traces true
		 *          trace(NumberUtils.isOdd(12)); // traces false
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function isOdd(value:Number):Boolean {
			return !isEven(value);
		}



		/**
		 * Determines if the {@code Number} is an {@code int}.
		 * @param value A {@code Number} to determine if it contains no decimal values
		 * @return {@code true} if the {@code Number} is an {@code int}
		 * @example
		 *      <code>
		 *          trace(NumberUtils.isInteger(13)); // traces true
		 *          trace(NumberUtils.isInteger(1.2345)); // traces false
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function isInteger(value:Number):Boolean {
			return (value % 1) == 0;
		}



		/**
		 * Determines if the {@code Number} is prime.
		 * @param value A {@code Number} to determine if it is only divisible by {@code 1} and itself.
		 * @return {@code true} if the {@code Number} is prime
		 * @example
		 *      <code>
		 *          trace(NumberUtils.isPrime(13)); // traces true
		 *          trace(NumberUtils.isPrime(4)); // traces false
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function isPrime(value:Number):Boolean {
			if(value == 1 || value == 2) {
				return true;
			}

			if(isEven(value)) {
				return false;
			}

			var s:Number = Math.sqrt(value);

			for(var i:Number = 3; i <= s; i++) {
				if(value % i == 0) {
					return false;
				}
			}

			return true;
		}



		/**
		 * Rounds a {@code Number}'s decimal value to a specific place.
		 * @param value {@code Number} to round
		 * @param place Decimal place to round
		 * @return {@code value} rounded to the defined place
		 * @example
		 *      <code>
		 *          trace(NumberUtils.roundToPlace(3.14159, 2)); // traces 3.14
		 *          trace(NumberUtils.roundToPlace(3.14159, 3)); // traces 3.142
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function roundDecimalToPlace(value:Number, place:uint):Number {
			var p:Number = Math.pow(10, place);

			return Math.round(value * p) / p;
		}



		/**
		 * Determines if {@code index} is included within the collection length otherwise the index loops to the
		 * beginning or end of the range and continues.
		 * @param index Index to loop if needed
		 * @param length Total elements in the collection
		 * @return Valid zero-based index
		 * @example
		 *      <code>
		 *          var colors:Array = new Array("Red", "Green", "Blue");
		 *          trace(colors[NumberUtils.loopIndex(2, colors.length)]); // traces Blue
		 *          trace(colors[NumberUtils.loopIndex(4, colors.length)]); // traces Green
		 *          trace(colors[NumberUtils.loopIndex(-6, colors.length)]); // traces Red
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		//noinspection FunctionWithMultipleReturnPointsJS
		public static function loopIndex(index:int, length:uint):uint {
			var i:int = index;

			if(i < 0) {
				i = length + i % length;
			}

			if(i >= length) {
				return i % length;
			}

			return i;
		}



		/**
		 * Determines if the {@code Number} is included within a range.
		 * @param value {@code Number} to determine if it is included in the range
		 * @param firstValue First value of the range
		 * @param secondValue Second value of the range
		 * @return {@code true} if the number falls within the range
		 * @usageNote Range values do not need to be in order
		 * @example
		 *      <code>
		 *          trace(NumberUtils.isBetween(3, 0, 5)); // traces true
		 *          trace(NumberUtils.isBetween(7, 0, 5)); // traces false
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function isBetween(value:Number, firstValue:Number, secondValue:Number):Boolean {
			return !(value < Math.min(firstValue, secondValue) || value > Math.max(firstValue, secondValue));
		}



		/**
		 * Resticts the {@code Number} to the {@code min} and {@code max}.
		 * @param value {@code Number} to restrict
		 * @param min Minimum {@code Number} for {@code value} to be
		 * @param max Maximmum {@code Number} for {@code value} to be
		 * @return Restricted {@code value}
		 * @todo Optimize for faster access (no static)
		 */
		public static function confine(value:Number, min:Number, max:Number):Number {
			//noinspection NestedConditionalExpressionJS
			return value < min ? min : (value > max ? max : value);
		}



		/**
		 * Pads the {@code Number} with the set number of digits before and after the point.
		 * If the number of digits in the integer of {@code value} is less than {@code beforePoint}, the remaining
		 * digits are filled with zeros. If the number of digits in the decimal of {@code value} is less than
		 * {@code afterPoint}, the remaning digits are filled with zeros.
		 * @param value {@code Number} to pad
		 * @param beforePoint Number of digits to pad before the point
		 * @param afterPoint Number of digits to pad after the point
		 * @return {@code value} padded as a {@code String}
		 * @example
		 *      <code>
		 *          NumberUtils.pad(.824, 0, 5); // returns ".82400"
		 *          NumberUtils.pad(9, 3, 2); // returns "009.00"
		 *          NumberUtils.pad(2835.3, 4, 2); // returns "2835.30"
		 *      </code>
		 * @todo Test
		 * @todo Optimize for faster access (no static)
		 */
		public static function pad(value:Number, beforePoint:uint, afterPoint:uint = 0):String {
			// separate the integer from the decimal
			var valueArray:Array = String(value).split(".");

			var integer:String = valueArray[0];

			// determine the sign of the value
			var negative:Boolean = integer.substr(0, 1) == "-";

			// remove the "-" if it exists
			if(negative) integer = integer.substr(1);

			// treat zeros as empty, so integer.length doesn't return 1 when integer is 0
			if(integer == "0") {
				integer = "";
			}

			var len:int = integer.length;

			// determine how many times "0" needs to be prepended
			var zeros:int = Math.max(0, beforePoint - len);

			// prepend "0" until zeros == 0
			while(zeros--) integer = "0" + integer;

			var decimal:String;

			// if a point didn't exist or the decimal is 0, empty the decimal
			if(valueArray.length == 1 || valueArray[1] == "0") {
				decimal = "";
			}
			else {
				decimal = valueArray[1];
			}

			//noinspection ReuseOfLocalVariableJS
			len = decimal.length;

			// determine how many times "0" needs to be appended
			//noinspection ReuseOfLocalVariableJS
			zeros = Math.max(0, afterPoint - len);

			// append "0" until zeros == 0
			while(zeros--) decimal += "0";

			// set sign if negative
			var sign:String = negative ? "-" : "";

			// set point if a decimal exists (or afterPoint > 0, determined earlier)
			var point:String = decimal ? "." : "";

			return sign + integer + point + decimal;
		}



		/**
		 * Rounds a {@code Number} to the nearest nth, where {@code digits} is n / 10.
		 * @param value {@code Number} to round
		 * @param digits Number of digits to show after the point
		 * @return Rounded {@code value}
		 * @todo Optimize for faster access (no static)
		 */
		public static function round(value:Number, digits:int):Number {
			var d:int = digits;

			d = Math.pow(10, d);

			return Math.round(value * d) / d;
		}



		/**
		 * Inserts commas every three digits in the integer of {@code value}.
		 * @param value {@code Number} to insert commas into
		 * @return {@code value} as a {@code String} formatted with commas
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function insertCommas(value:Number):String {
			// convert the value to a string
			var valueString:String = String(value);

			// determine the location of the point
			var commaIndex:int = valueString.indexOf(".");

			// if a point doesn't exist, consider it to be at the end of the value
			if(commaIndex == -1) commaIndex = valueString.length;

			do {
				// move to the left three digits
				commaIndex -= 3;

				// if index is beyond the beginning of the value, end the loop
				if(commaIndex <= 0) break;

				// insert the comma
				valueString = valueString.substring(0, commaIndex) + "," + valueString.substr(commaIndex);
			}
			while(true);

			// remove "0" if value is a decimal
			if(valueString.substr(0, 2) == "0.") valueString = valueString.substr(1);

			return valueString;
		}



		/**
		 * Creates evenly spaced numerical increments between two {@code Number}s.
		 * @param begin Starting value
		 * @param end Ending value
		 * @param steps {@code Number} of increments between the {@code begin} and {@code end}
		 * @return {@code Array} composed of the increments between the {@code begin} and {@code end}
		 * @example
		 *      <code>
		 *          trace(NumberUtils.createStepsBetween(0, 5, 4)); // traces 1,2,3,4
		 *          trace(NumberUtils.createStepsBetween(1, 3, 3)); // traces 1.5,2,2.5
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function createStepsBetween(begin:Number, end:Number, steps:Number):Array {
			var s:Number = steps + 1;

			var i:uint = 0;
			var stepsBetween:Array = [];
			var increment:Number = (end - begin) / s;

			while(++i < s) {
				stepsBetween.push((i * increment) + begin);
			}

			return stepsBetween;
		}



		/**
		 * Determines a value between two specified values.
		 * @param amount Level of interpolation between the two values. If {@code 0%}, {@code begind} value is returned; if {@code 100%}, {@code end} value is returned
		 * @param minimum Lower value
		 * @param maximum Upper value
		 * @example
		 *      <code>
		 *          trace(NumberUtils.interpolate(new Percent(0.5), 0, 10)); // traces 5
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function interpolate(amount:Percent, minimum:Number, maximum:Number):Number {
			return minimum + (maximum - minimum) * amount.decimalPercentage;
		}



		/**
		 * Determines a {@code Percent} of a value in a given range.
		 * @param value Value to be converted
		 * @param minimum Lower value of the range
		 * @param maximum Upper value of the range
		 * @example
		 *      <code>
		 *          trace(NumberUtils.normalize(8, 4, 20).decimalPercentage); // traces 0.25
		 *      </code>
		 * @see Percent
		 * @todo Optimize for faster access (no static)
		 */
		public static function normalize(value:Number, minimum:Number, maximum:Number):Percent {
			return new Percent((value - minimum) / (maximum - minimum));
		}



		/**
		 * Maps a {@code Number} from one coordinate space to another.
		 * @param value {@code Number} from the input coordinate space to map to the output coordinate space
		 * @param min1 Starting value of the input coordinate space
		 * @param max1 Ending value of the input coordinate space
		 * @param min2 Starting value of the output coordinate space
		 * @param max2 Ending value of the output coordinate space
		 * @example
		 *      <code>
		 *          trace(NumberUtils.map(0.75, 0, 1, 0, 100)); // traces 75
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function map(value:Number, min1:Number, max1:Number, min2:Number, max2:Number):Number {
			//noinspection OverlyComplexArithmeticExpressionJS
			return min2 + (max2 - min2) * ((value - min1) / (max1 - min1));
		}



		/**
		 * Low pass filter alogrithm for easing a {@code Number} toward a destination value. Works best for tweening
		 * values when no definite time duration exists and when the destination value changes.
		 * If {@code (0.5 < n < 1)}, then the resulting values will overshoot (ping-pong) until they reach the
		 * destination value. When {@code n} is greater than {@code 1}, as its value increases, the time it takes to
		 * reach the destination also increases. A pleasing value for {@code n} is {@code 5}.
		 * @param value Current value
		 * @param dest Destination value
		 * @param n Slowdown factor
		 * @return Weighted average
		 * @todo Optimize for faster access (no static)
		 */
		public static function getWeightedAverage(value:Number, dest:Number, n:Number):Number {
			return value + (dest - value) / n;
		}



		/**
		 * Formats a {@code Number}.
		 * @param value {@code Number} you wish to format
		 * @param minLength Minimum length of the {@code Number}
		 * @param thouDelim Character used to seperate thousands
		 * @param fillChar Leading character used to make the {@code Number} the minimum length
		 * @return Formated {@code Number} as a {@code String}
		 * @example
		 *      <code>
		 *          trace(NumberUtils.format(1234567, 8, ",")); // traces 01,234,567
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function format(value:Number, minLength:uint, thouDelim:String = null, fillChar:String = null):String {
			var num:String = value.toString();
			var len:uint = num.length;
			var ml:uint = minLength;

			if(thouDelim != null) {
				var numSplit:Array = num.split('');
				var counter:uint = 3;
				var i:uint = numSplit.length;

				while(--i > 0) {
					counter--;
					if(counter == 0) {
						counter = 3;
						numSplit.splice(i, 0, thouDelim);
					}
				}

				num = numSplit.join('');
			}

			if(ml != 0) {
				if(len < ml) {
					ml -= len;

					var addChar:String = (fillChar == null) ? '0' : fillChar;

					while(ml--)
						num = addChar + num;
				}
			}

			return num;
		}



		/**
		 * Finds the English ordinal suffix for the number given.
		 * @param value {@code Number} to find the ordinal suffix of
		 * @return Suffix for the {@code Number}, 2 characters
		 * @example
		 *      <code>
		 *          trace(32 + NumberUtils.getOrdinalSuffix(32)); // traces 32nd
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function getOrdinalSuffix(value:int):String {
			var out:String;

			if(value >= 10 && value <= 20) {
				out = 'th';
			}

			switch(value % 10) {
				case 0 :
				case 4 :
				case 5 :
				case 6 :
				case 7 :
				case 8 :
				case 9 :
					out = 'th';
					break;

				case 3 :
					out = 'rd';
					break;

				case 2 :
					out = 'nd';
					break;

				case 1 :
					out = 'st';
					break;

				default :
					out = '';
			}

			return out;
		}



		/**
		 * Adds a leading zero for {@code Number}s less than ten.
		 * @param value {@code Number} to add leading zero
		 * @return {@code Number} as a {@code String}; if the {@code Number} was less than ten the {@code Number} will have a leading zero
		 * @example
		 *      <code>
		 *          trace(NumberUtils.addLeadingZero(7)); // traces 07
		 *          trace(NumberUtils.addLeadingZero(11)); // traces 11
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 */
		public static function addLeadingZero(value:Number):String {
			return (value < 10) ? '0' + value : value.toString();
		}



		/**
		 * Determines whether or not the supplied {@code Number} is positive.
		 * @param value {@code Number} to evaluate
		 * @return Whether or not the supplied {@code Number} is positive
		 * @todo Optimize for faster access (no static)
		 */
		public static function isPositive(value:Number):Boolean {
			return Boolean(value >= 0);
		}



		/**
		 * Determines whether or not the supplied {@code Number} is negative.
		 * @param value {@code Number} to evaluate
		 * @return Whether or not the supplied {@code Number} is negative
		 * @todo Optimize for faster access (no static)
		 */
		public static function isNegative(value:Number):Boolean {
			return !isPositive(value);
		}
	}
}
