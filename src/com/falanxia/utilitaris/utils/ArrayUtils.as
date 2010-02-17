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
	 * Array utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class ArrayUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function ArrayUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Returns the first element that matches {@code match} for the property {@code key}.
		 * @param inArray {@code Array} to search for an element with a {@code key} that matches {@code match}
		 * @param key Name of the property to match.
		 * @param match Value to match against
		 * @return Matched {@code Object}; otherwise {@code null}
		 * @todo Test
		 */
		public static function getItemByKey(inArray:Array, key:String, match:*):* {
			var out:*;

			for each(var item:* in inArray) {
				if(item[key] == match) {
					out = item;
				}
			}

			return out;
		}



		/**
		 * Returns every element that matches {@code match} for the property {@code key}.
		 * @param inArray {@code Array} to search for object with {@code key} that matches {@code match}
		 * @param key Name of the property to match
		 * @param match Value to match against
		 * @return All the matched elements
		 * @todo Test
		 */
		public static function getItemsByKey(inArray:Array, key:String, match:*):Array {
			var t:Array = [];

			for each(var item:* in inArray) {
				if(item[key] == match) {
					t.push(item);
				}
			}

			return t;
		}



		/**
		 * Returns the first element that is compatible with a specific data type, class, or interface.
		 * @param inArray {@code Array} to search for an element of a specific type
		 * @param type Type to compare the elements to
		 * @return All the matched elements
		 * @todo Test
		 */
		public static function getItemByType(inArray:Array, type:Class):* {
			var out:*;

			for each(var item:* in inArray) {
				if(item is type) {
					out = item;
				}
			}

			return out;
		}



		/**
		 * Returns every element that is compatible with a specific data type, class, or interface
		 * @param inArray {@code Array} to search for elements of a specific type
		 * @param type Type to compare the elements to
		 * @return All the matched elements
		 * @todo Test
		 */
		public static function getItemsByType(inArray:Array, type:Class):Array {
			var t:Array = [];

			for each(var item:* in inArray) {
				if(item is type) {
					t.push(item);
				}
			}

			return t;
		}



		/**
		 * Modifies original {@code Array} by adding all the elements from another {@code Array} at a specified position.
		 * @param tarArray {@code Array} to add elements to
		 * @param items {@code Array} of elements to add
		 * @param index Position where the elements should be added
		 * @return {@code true} if the {@code Array} was changed as a result of the call
		 * @example
		 *      <code>
		 *          var alphabet:Array = new Array("a", "d", "e");
		 *          var parts:Array = new Array("b", "c");
		 *          ArrayUtils.addItemsAt(alphabet, parts, 1);
		 *          trace(alphabet);
		 *      </code>
		 * @todo Test
		 */
		public static function addItemsAt(tarArray:Array, items:Array, index:int = 0x7FFFFFFF):Boolean {
			var out:Boolean = true;

			if(items.length == 0) out = false;
			else {
				var args:Array = items.concat();
				args.splice(0, 0, index, 0);
				tarArray.splice.apply(null, args);
			}

			return out;
		}



		/**
		 * Creates new {@code Array} composed of only the non-identical elements of passed {@code Array}.
		 * @param inArray {@code Array} to remove equivalent items
		 * @return New {@code Array} composed of only unique elements
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 4, 4, 4, 4, 5);
		 *          trace(ArrayUtils.removeDuplicates(numberArray));
		 *      </code>
		 * @todo Test
		 */
		public static function removeDuplicates(inArray:Array):Array {
			return inArray.filter(_removeDuplicatesFilter);
		}



		/**
		 * Modifies original {@code Array} by removing all items that are identical to the specified item.
		 * @param tarArray {@code Array} to remove passed {@code item}
		 * @param item Element to remove
		 * @return Amount of removed elements that matched {@code item}, if none found returns {@code 0}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 7, 7, 7, 4, 5);
		 *          trace("Removed " + ArrayUtils.removeItem(numberArray, 7) + " items.");
		 *          trace(numberArray);
		 *      </code>
		 * @todo Test
		 */
		public static function removeItem(tarArray:Array, item:*):uint {
			var i:int = tarArray.indexOf(item);
			var f:uint = 0;

			while(i != -1) {
				tarArray.splice(i, 1);
				i = tarArray.indexOf(item, i);
				f++;
			}

			return f;
		}



		/**
		 * Removes only the specified items in an {@code Array}.
		 * @param tarArray {@code Array} to remove specified items from
		 * @param items {@code Array} of elements to remove
		 * @return {@code true} if the {@code Array} was changed as a result of the call
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 7, 7, 7, 4, 5);
		 *          ArrayUtils.removeItems(numberArray, new Array(1, 3, 7, 5));
		 *          trace(numberArray);
		 *      </code>
		 * @todo Test
		 */
		public static function removeItems(tarArray:Array, items:Array):Boolean {
			var removed:Boolean = false;
			var l:uint = tarArray.length;

			while(l--) {
				if(items.indexOf(tarArray[l]) > -1) {
					tarArray.splice(l, 1);
					removed = true;
				}
			}

			return removed;
		}



		/**
		 * Retains only the specified items in an {@code Array}.
		 * @param tarArray {@code Array} to remove non specified items from
		 * @param items {@code Array} of elements to keep
		 * @return {@code true} if the {@code Array} was changed as a result of the call
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 7, 7, 7, 4, 5);
		 *          ArrayUtils.retainItems(numberArray, new Array(2, 4));
		 *          trace(numberArray);
		 *      </code>
		 * @todo Test
		 */
		public static function retainItems(tarArray:Array, items:Array):Boolean {
			var removed:Boolean = false;
			var l:uint = tarArray.length;

			while(l--) {
				if(items.indexOf(tarArray[l]) == -1) {
					tarArray.splice(l, 1);
					removed = true;
				}
			}

			return removed;
		}



		/**
		 * Finds out how many instances of {@code item} {@code Array} contains.
		 * @param inArray {@code Array} to search for {@code item} in
		 * @param item {@code Object} to find
		 * @return Amount of {@code item}'s found; if none were found returns {@code 0}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 7, 7, 7, 4, 5);
		 *          trace("numberArray contains " + ArrayUtils.contains(numberArray, 7) + " 7's.");
		 *      </code>
		 * @todo Test
		 */
		public static function contains(inArray:Array, item:*):uint {
			var i:int = inArray.indexOf(item, 0);
			var t:uint = 0;

			while(i != -1) {
				i = inArray.indexOf(item, i + 1);
				t++;
			}

			return t;
		}



		/**
		 * Determines if {@code Array} contains all items.
		 * @param inArray {@code Array} to search for {@code items} in
		 * @param items {@code Array} of elements to search for
		 * @return {@code true} if {@code inArray} contains all elements of {@code items}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 4, 5);
		 *          trace(ArrayUtils.containsAll(numberArray, new Array(1, 3, 5)));
		 *      </code>
		 * @todo Test
		 */
		public static function containsAll(inArray:Array, items:Array):Boolean {
			var out:Boolean = true;
			var l:uint = items.length;

			while(l--) {
				if(inArray.indexOf(items[l]) == -1) out = false;
			}

			return out;
		}



		/**
		 * Determines if {@code Array} {@code inArray} contains any element of {@code Array} {@code items}.
		 * @param inArray {@code Array} to search for {@code items} in
		 * @param items {@code Array} of elements to search for
		 * @return {@code true} if {@code inArray} contains any element of {@code items}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 4, 5);
		 *          trace(ArrayUtils.containsAny(numberArray, new Array(9, 3, 6)));
		 *      </code>
		 * @todo Test
		 */
		public static function containsAny(inArray:Array, items:Array):Boolean {
			var out:Boolean;
			var l:uint = items.length;

			while(l--) {
				if(inArray.indexOf(items[l]) > -1) out = true;
			}

			return out;
		}



		/**
		 * Determines if two {@code Array}s contain the same {@code Object}s at the same index.
		 * @param first First {@code Array} to compare to the {@code second}
		 * @param second Second {@code Array} to compare to the {@code first}
		 * @return {@code true} if {@code Array}s are the same
		 * @todo Test
		 */
		public static function equals(first:Array, second:Array):Boolean {
			var out:Boolean = true;
			var i:uint = first.length;

			if(i == second.length) {
				while(i--) {
					if(first[i] != second[i]) out = false;
				}
			}
			else out = false;

			return out;
		}



		/**
		 * Compares two {@code Array}s and finds the first index where they differ.
		 * @param first First {@code Array} to compare to the {@code second}
		 * @param second Second {@code Array} to compare to the {@code first}
		 * @param fromIndex Location in the {@code Array}s from which to start searching for a difference
		 * @return First position/index where the {@code Array}s differ; if {@code Array}s are identical returns {@code -1}
		 * @example
		 *      <code>
		 *          var color24:Array = new Array("Red", "Blue", "Green", "Indigo", "Violet");
		 *          var colorsAlt:Array = new Array("Red", "Blue", "Green", "Violet");
		 *          trace(ArrayUtils.getIndexOfDifference(color24, colorsAlt)); // traces 3
		 *      </code>
		 * @todo Test
		 */
		public static function getIndexOfDifference(first:Array, second:Array, fromIndex:uint = 0):int {
			var out:int = -1;
			var i:int = fromIndex - 1;

			while(++i < first.length) {
				if(first[i] != second[i]) out = i;
			}

			return out;
		}



		/**
		 * Creates new {@code Array} composed of passed {@code Array}'s items in a random order.
		 * @param inArray {@code Array} to create copy of, and randomize
		 * @return New {@code Array} composed of passed {@code Array}'s items in a random order
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
		 *          trace(ArrayUtils.randomize(numberArray));
		 *      </code>
		 * @todo Test
		 */
		public static function randomize(inArray:Array):Array {
			var t:Array = [];
			var r:Array = inArray.sort(_sortRandom, Array.RETURNINDEXEDARRAY);
			var i:int = -1;

			while(++i < inArray.length) {
				t.push(inArray[r[i]]);
			}

			return t;
		}



		/**
		 * Adds all items in {@code inArray} and returns the value.
		 * @param inArray {@code Array} composed only of numbers
		 * @return Total of all numbers in {@code inArray} added
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(2, 3);
		 *          trace("Total is: " + ArrayUtils.sum(numberArray));
		 *      </code>
		 * @todo Test
		 */
		public static function sum(inArray:Array):Number {
			var t:Number = 0;
			var l:uint = inArray.length;

			while(l--) {
				t += inArray[l];
			}

			return t;
		}



		/**
		 * Averages the values in {@code inArray}.
		 * @param inArray {@code Array} composed only of numbers
		 * @return Average of all numbers in the {@code inArray}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(2, 3, 8, 3);
		 *          trace("Average is: " + ArrayUtils.average(numberArray));
		 *      </code>
		 * @todo Test
		 */
		public static function average(inArray:Array):Number {
			var out:Number;

			if(inArray.length == 0) out = 0;
			else out = sum(inArray) / inArray.length;

			return out;
		}



		/**
		 * Finds the lowest value in {@code inArray}.
		 * @param inArray {@code Array} composed only of numbers
		 * @return Lowest value in {@code inArray}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(2, 1, 5, 4, 3);
		 *          trace("The lowest value is: " + ArrayUtils.getLowestValue(numberArray));
		 *      </code>
		 * @todo Test
		 */
		public static function getLowestValue(inArray:Array):Number {
			//noinspection NonShortCircuitBooleanExpressionJS
			return inArray[inArray.sort(16 | 8)[0]];
		}



		/**
		 * Finds the highest value in {@code inArray}.
		 * @param inArray {@code Array} composed only of numbers
		 * @return Highest value in {@code inArray}
		 * @example
		 *      <code>
		 *          var numberArray:Array = new Array(2, 1, 5, 4, 3);
		 *          trace("The highest value is: " + ArrayUtils.getHighestValue(numberArray));
		 *      </code>
		 * @todo Test
		 */
		public static function getHighestValue(inArray:Array):Number {
			//noinspection NonShortCircuitBooleanExpressionJS
			return inArray[inArray.sort(16 | 8)[inArray.length - 1]];
		}



		/* ★ PRIVATE METHODS ★ */


		protected static function _removeDuplicatesFilter(e:*, i:int, inArray:Array):Boolean {
			return (i == 0) ? true : inArray.lastIndexOf(e, i - 1) == -1;
		}



		protected static function _sortRandom(a:*, b:*):int {
			return RandomUtils.integer(0, 1) ? 1 : -1;
		}
	}
}
