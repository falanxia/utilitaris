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

package com.falanxia.utilitaris.collections {



	/**
	 * Array picker.
	 *
	 * Array picker class lets you declare array of items you want to use (poolArray) and ensures that item that is
	 * acutally in use cannot be used again (is moved to reservedArray) until its flagged as unused (returned to
	 * poolArray); BEWARE: For better performance and flexibility, ArrayPicker breaks encapsulation in methods getPool() and
	 * getReservedItems() - it returns not copy of poolArray/reservedArray, but reference to it.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public final class ArrayPicker extends Object {


		private var poolArray:Array;
		private var reservedArray:Array;



		/**
		 * Constructor.
		 */
		public function ArrayPicker():void {
			poolArray = [];
			reservedArray = [];
		}



		/**
		 * Sets Array of items we want to work with, if poolArray is already set, we rewrite it and empty reservedArray.
		 * @param value Array of items
		 */
		public function init(value:Array):void {
			poolArray = value;

			if(poolArray.length > 0) {
				reservedArray = [];
			}
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			poolArray = null;
			reservedArray = null;
		}



		/**
		 * Adds item to poolArray
		 * @param item Object to be added to pool
		 */
		public function addToPool(item:Object):void {
			if(item == null) return;
			poolArray.push(item);
		}



		/**
		 * Returns array of actually unused items.
		 * @return Array of unused items
		 */
		public function getPool():Array {
			return poolArray;
		}



		/**
		 * Grabs item from pool, puts it to reservedItems and returns it.
		 * @param value Selected item, null if there is no item in pool left
		 */
		public function getFromPool(value:Object):Object {
			var tmpi:int = poolArray.indexOf(value);

			if(tmpi > -1) {
				var o:Object = poolArray[tmpi];
				reservedArray.push(o);
				poolArray.splice(tmpi, 1);
				return o;
			}
			return null;
		}



		public function getFromPoolAt(index:int):Object {
			if(index >= poolArray.length) {
				return null;
			}
			var o:Object = poolArray[index];
			reservedArray.push(o);
			poolArray.splice(index, 1);
			return o;
		}



		/**
		 * Gets random item from poolArray, puts it to reservedItems and returns it.
		 * @return Random item from poolArray, null if there is no item in pool left
		 */
		public function getRandomFromPool():Object {
			var randomi:int = randRange(0, poolArray.length - 1);
			var ret:Object;

			if(poolArray[randomi] != undefined) {
				ret = poolArray[randomi];
				reservedArray.push(ret);
				poolArray.splice(randomi, 1);
			}

			return ret;
		}



		/**
		 * Gets first item in poolArray, puts it to reservedItems and returns it.
		 * @return First item in poolArray, null if there is no item in pool left
		 */
		public function getFirstFromPool():Object {
			var ret:Object;

			if(poolArray[0] != null) {
				ret = poolArray[0];
				reservedArray.push(ret);
				poolArray.splice(0, 1);
			}

			return ret;
		}



		/**
		 * Gets last item in poolArray, puts it to reservedItems and returns it.
		 * @return Last item in poolArray, null if there is no item in pool left
		 */
		public function getLastFromPool():Object {
			var ret:Object;

			if(poolArray.length > 0) {
				ret = poolArray.pop();
				reservedArray.push(ret);
			}

			return ret;
		}



		/**
		 * Gets number of items in reservedArray.
		 * @return Number of reserved items
		 */
		public function getReservedNumber():int {
			return reservedArray.length;
		}



		/**
		 * Gets number of available items (items in poolArray).
		 * @return Number of avaialable items
		 */
		public function getAvailableCount():int {
			return poolArray.length;
		}



		/**
		 * Returns the Array of reserved items
		 * @return Array of reserved items
		 */
		public function getReservedItems():Array {
			return reservedArray;
		}



		/**
		 * Returns number of all items, both in pool and reserved array.
		 * @return int number of all items in arrayPicker instance.
		 */
		public function getItemsNum():int {
			return poolArray.length + reservedArray.length;
		}



		/**
		 * Picks selected item from reservedArray and returns it to the poolArray of unused items.
		 * @param item Item we want to return to unused items poolArray
		 */
		public function returnToPool(item:Object):void {
			var tmpi:int = reservedArray.indexOf(item);

			if(tmpi > -1) {
				poolArray.push(reservedArray[tmpi]);
				reservedArray.splice(tmpi, 1);
			}
		}



		/**
		 * Returns all items from reservedItems to poolArray.
		 */
		public function returnAllToPool():void {
			poolArray = poolArray.concat(reservedArray);
			reservedArray = [];
		}



		/**
		 * Checks, if item is reserved.
		 * @param item Item to check
		 * @return true, if item is in reservedArray
		 */
		public function isReservered(item:Object):Boolean {
			var tmpi:Number = reservedArray.indexOf(item);
			var out:Boolean;

			if(tmpi > -1) out = true;

			return out;
		}



		private function randRange(min:Number, max:Number):Number {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
	}
}
