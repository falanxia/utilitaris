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
package com.falanxia.utilitaris.collections {

	/**
	 * Array picker class lets you declare array of items you want to use (poolArray) and ensures that item that is
	 * acutally in use cannot be used again (is moved to reservedArray) until its flagged as unused (returned to
	 * poolArray); BEWARE: For better performance and flexibility, ArrayPicker breaks encapsulation in methods getPool() and
	 * getReservedItems() - it returns not copy of poolArray/reservedArray, but reference to it.
	 */
	public final class ArrayPicker extends Object {

		private var poolArray:Array;
		private var reservedArray:Array;



		/**
		 * Initilizes arrays
		 */
		public function ArrayPicker():void {

			poolArray = [];
			reservedArray = [];

		}



		/**
		 * Sets array of items we want to work with, if poolArray is already set, we rewrite it and empty reservedArray
		 * @param a array of items
		 */
		public function init(a:Array):void {

			poolArray = a;

			if(poolArray.length > 0) {

				reservedArray = [];

			}


		}



		/**
		 * Returns array of actually unused items
		 * @return array array of unused items
		 */
		public function getPool():Array {

			return poolArray;

		}



		/**
		 * Grabs item from pool, puts it to reservedItems and returns it
		 * @param item selected item, null if there is no item in pool left
		 */
		public function getFromPool(item:Object):void {

			var tmpi:int = poolArray.indexOf(item);
			if(tmpi > -1) {

				reservedArray.push(poolArray[tmpi]);
				poolArray.splice(tmpi, 1);

			}

		}



		/**
		 * Gets random item from poolArray, puts it to reservedItems and returns it
		 * @return random item from poolArray, null if there is no item in pool left
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
		 * Gets first item in poolArray, puts it to reservedItems and returns it
		 * @return first item in poolArray, null if there is no item in pool left
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
		 * Gets last item in poolArray, puts it to reservedItems and returns it
		 * @return item last item in poolArray, null if there is no item in pool left
		 */
		public function getLastFromPool():Object {

			var ret:Object;
			if(poolArray.length > 0) {

				ret = poolArray.pop();
				reservedArray.push(ret);

			}

			return ret


		}



		/**
		 * Gets number of items in reservedArray
		 * @return number of reserved items
		 */
		public function getReservedNumber():int {

			return reservedArray.length;

		}



		/**
		 * Gets number of available items (items in pool)
		 * @return number of avaialable items
		 */
		public function getAvailableNumber():int {

			return poolArray.length;

		}



		/**
		 * Returns the array of reserved items
		 * @return array of reserved items
		 */
		public function getReservedItems():Array {

			return reservedArray;

		}



		/**
		 * Picks selected item from reservedArray and returns it to the pool of unused items
		 * @param item item we want to return to unused items pool
		 */
		public function returnToPool(item:Object):void {

			var tmpi:int = reservedArray.indexOf(item);
			if(tmpi > -1) {

				poolArray.push(reservedArray[tmpi]);
				reservedArray.splice(tmpi, 1);

			}

		}



		/**
		 * Returns all items from reservedItems to poolArray
		 */
		public function returnAllToPool():void {

			poolArray = poolArray.concat(reservedArray);

			reservedArray = [];

		}



		/**
		 * Checks, if item is reserved
		 * @param item item to check
		 * @return true, if item is in reservedArray
		 */
		public function isReservered(item:Object):Boolean {

			var tmpi:Number = reservedArray.indexOf(item);
			if(tmpi > -1) {
				return true;
			}
			return false;

		}



		private function randRange(min:Number, max:Number):Number {

			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;

		}
	}
}
