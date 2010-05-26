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
	 * Random utilities.
	 *
	 * @author Grant Skinner (<a href="http://gskinner.com">gskinner.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class RandomUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function RandomUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Returns a {@code Number} between {@code 0}-{@code 1} exclusive.
		 * @return {@code Number} between {@code 0}-{@code 1} exclusive.
		 * TODO: Optimize for faster access (no static)
		 */
		public static function random():Number {
			return Math.random();
		}



		/**
		 * Returns a float {@code Number} between {@code min}-{@code max} exclusive.
		 * @param min Minimal value
		 * @param max Maximal value
		 * @return Float {@code Number} between {@code min}-{@code max} exclusive.
		 * @example
		 *      <code>
		 *          RandomUtils.float(50); // returns a number between 0-50 exclusive
		 *      </code>
		 * @example
		 *      <code>
		 *          RandomUtils.float(20,50); // returns a number between 20-50 exclusive
		 *      </code>
		 * TODO: Optimize for faster access (no static)
		 */
		public static function randomFloat(min:Number, max:Number = NaN):Number {
			var a:Number = min;
			var b:Number = max;

			if(isNaN(max)) {
				b = a;
				a = 0;
			}

			return random() * (b - a) + a;
		}



		/**
		 * Returns a {@code int} {@code Number} between {@code min}-{@code max} exclusive.
		 * @param min Minimal value
		 * @param max Maximal value
		 * @return {@code int} {@code Number} between {@code min}-{@code max} exclusive.
		 * @example
		 *      <code>
		 *          RandomUtils.integer(50); // returns an integer between 0-49 inclusive
		 *      </code>
		 * @example
		 *      <code>
		 *          RandomUtils.integer(20,50); // returns an integer between 20-49 inclusive
		 *      </code>
		 * TODO: Optimize for faster access (no static)
		 */
		public static function randomInteger(min:Number, max:Number = NaN):int {
			if(isNaN(max)) {
				max = min;
				min = 0;
			}
			// Need to use floor instead of bit shift to work properly with negative values:
			return Math.floor(randomFloat(min, max));
		}



		/**
		 * Returns a {@code Boolean}.
		 * @param chance Chance {@code Number} ({@code 0}-{@code 1})
		 * @return Float {@code Number} between {@code min}-{@code max} exclusive.
		 * @example
		 *      <code>
		 *          RandomUtils.boolean(); // returns true or false (50% chance of true)
		 *      </code>
		 * @example
		 *      <code>
		 *          RandomUtils.boolean(0.8); // returns true or false (80% chance of true)
		 *      </code>
		 * TODO: Optimize for faster access (no static)
		 */
		public static function randomBoolean(chance:Number = 0.5):Boolean {
			return (random() < chance);
		}



		/**
		 * Returns an {@code int}: {@code -1} or {@code 1}.
		 * @param chance Chance {@code Number} ({@code 0}-{@code 1})
		 * @return {@code int}: {@code -1} or {@code 1}.
		 * @example
		 *      <code>
		 *          RandomUtils.sign(); // returns 1 or -1 (50% chance of 1)
		 *      </code>
		 * @example
		 *      <code>
		 *          RandomUtils.sign(0.8); // returns 1 or -1 (80% chance of 1)
		 *      </code>
		 * TODO: Optimize for faster access (no static)
		 */
		public static function randomSign(chance:Number = 0.5):int {
			return (random() < chance) ? 1 : -1;
		}



		/**
		 * Returns a random bit.
		 * @param chance Chance {@code Number} ({@code 0}-{@code 1})
		 * @return Returns a random bit: {@code 0} or {@code 1}
		 * @example
		 *      <code>
		 *          RandomUtils.bit(); // returns 1 or 0 (50% chance of 1)
		 *      </code>
		 * @example
		 *      <code>
		 *          RandomUtils.bit(0.8); // returns 1 or 0 (80% chance of 1)
		 *      </code>
		 * TODO: Optimize for faster access (no static)
		 */
		public static function randomBit(chance:Number = 0.5):int {
			return (random() < chance) ? 1 : 0;
		}



		/**
		 * Generate a random {@code String}.
		 * @param length {@code String} length (default {@code 10})
		 * @param ch Chars used (default {@code "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"})
		 * @return Random {@code String}
		 * TODO: Optimize for faster access (no static)
		 */
		public static function randomString(length:uint = 10, ch:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"):String {
			var alphabet:Array = ch.split("");
			var alphabetLength:int = alphabet.length;
			var randomLetters:String = "";

			for(var j:uint = 0; j < length; j++) {
				var r:Number = Math.random() * alphabetLength;
				var s:int = Math.floor(r);
				randomLetters += alphabet[s];
			}

			return randomLetters;
		}



		/**
		 * Get random sentence.
		 * @param maxLength Max chars
		 * @param minLength Min chars
		 * @return Random sentence
		 */
		public static function randomSentence(maxLength:uint = 50, minLength:uint = 10):String {
			return randomString(randomInteger(minLength, maxLength), "            abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
		}
	}
}
