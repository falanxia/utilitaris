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

package com.falanxia.utilitaris.collections
{

	import flash.utils.Dictionary;



	/**
	 *
	 */
	public final class IndexedHashMap extends Object {

		private var _length:int;
		private var dicto:Dictionary;
		private var array:Array;



		/**
		 * Inits the IndexedHashmap
		 */
		public function IndexedHashMap() {
			super();

			dicto = new Dictionary();
			array = [];

		}



		/**
		 * Adds item to the end of the collection
		 * @param itemName name identifier
		 * @param item object
		 */
		public function addItem(itemName:String, item:Object):void {

			var ihm:IHMObject = new IHMObject(item, itemName);

			dicto[itemName] = ihm;
			array.push(ihm);
			ihm.index = array.length - 1;

			_length++;

		}



		/**
		 * Adds item to specified index, if index is out of bounds we add it to the end of the collection
		 * @param itemName name identifier
		 * @param item object
		 * @param i desired item index
		 */
		public function addItemAt(itemName:String, item:Object, i:int):void {

			var ihm:IHMObject = new IHMObject(item, itemName);

			dicto[itemName] = ihm;
			var n:int = addToArrayAt(i, ihm);
			ihm.index = n;

			_length++;

		}



		/**
		 * Removes item specified object reference
		 * @param item object reference
		 * @return Boolean false if object wasnt in collection
		 */
		public function removeItem(item:Object):Boolean {

			var i:int = array.indexOf(item);

			if(i == -1) {
				return false;
			}

			var ihm:IHMObject = array[i];
			dicto[ihm.name] = null;
			removeFromArrayAt(i);

			_length--;

			return true;

		}



		/**
		 * Removes item specified by item name
		 * @param itemName name of object
		 * @return Boolean false if object wasnt in collection
		 */
		public function removeItemByName(itemName:String = null):Boolean {

			var b:Boolean = removeFromArrayAt(array.indexOf(dicto[itemName]));
			if(b) {

				dicto[itemName] = null;
				_length--;

				return true;

			}

			return false;

		}



		/**
		 * Removes item specified by index in collection
		 * @param i item index
		 * @return Boolean false if  object wasnt in collection
		 */
		public function removeItemAt(i:int):Boolean {

			if(i > array.length - 1) {
				return false;
			}

			var ihm:IHMObject = array[i];
			dicto[ihm.name] = null;
			removeFromArrayAt(i);

			_length--;

			return true;

		}



		/**
		 * Moves the item specified by item reference,item name or item index to selected index.
		 * Priority is: item | itemName | itemIndex. If targetIndex >= than collection length, it pushes it at the
		 * end of the collection.
		 * @param targetIndex target index we want item to be moved to
		 * @param item specify if we want reference item by item reference
		 * @param itemName specify if we want reference item by name
		 * @param itemIndex specify if we want reference item by index
		 * @return Boolean false if item wasnt found in collection
		 */
		public function setItemIndex(targetIndex:int, item:Object = null, itemName:String = null, itemIndex:int = -1):Boolean {

			var o:Object;

			if(item != null) {

				var i:int = array.indexOf(o);

				if(i < 0) {
					return false;
				}

				removeFromArrayAt(i);
				addToArrayAt(targetIndex, o);

			} else if(itemName != null) {

				o = dicto[itemName];
				var i:int = array.indexOf(o);

				if(i < 0) {
					return false;
				}

				removeFromArrayAt(i);
				addToArrayAt(targetIndex, o);

				return true;

			} else if(itemIndex > 0) {

				o = getItemAt(itemIndex);
				removeFromArrayAt(itemIndex);
				addToArrayAt(targetIndex, o);

				return true;
			}

			return false;


		}



		/**
		 * Returns all items in collection.
		 * @return Array array containing all items in collection.
		 */
		public function getItems():Array {

			var a:Array = new Array();
			for(var i:int; i < array.length; i++) {
				a.push(array[i].item);
			}

			return a;

		}



		/**
		 * Returns item on index
		 * @param i item index in collection
		 * @return Object item specified by index i, null if index is out of bounds
		 */
		public function getItemAt(i:int):Object {

			if(i >= array.length) {

				return null;

			}

			return array[i].item;

		}



		/**
		 * Returns item specified by name
		 * @param s name of item
		 * @return Object item specified by name, null if item wasnt found in collection
		 */
		public function getItemByName(s:String):Object {

			if(dicto[s] == null) {
				return null;
			}

			return dicto[s].item;

		}



		/**
		 * @return int number of items in collection
		 */
		public function get length():int {

			return _length;

		}



		/*
		 CORE FUNCTIONS
		 */

		private function removeFromArrayAt(index:int):Boolean {

			if(index >= array.length) {
				return false;
			}

			var a:Array = [];
			var i:int
			for(i = 0; i < index; i++) {
				a.push(array[i]);
			}

			var l:int = array.length;
			for(i = index + 1; i < l; i++) {
				a.push(array[i]);
			}

			array = a;

			return true;

		}



		private function addToArrayAt(index:int, item:Object):int {

			if(index >= array.length) {
				array.push(item);
				return array.length - 1;
			}

			var a:Array = [];
			var i:int;
			for(i = 0; i < index; i++) {
				a.push(array[i]);
			}

			a.push(item);

			var l:int = array.length;
			for(i = index; i < l; i++) {
				a.push(array[i]);

			}

			array = a;

			return index;

		}


	}
}
