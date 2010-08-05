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
	import flash.utils.*;



	/**
	 * Indexed Hash Map.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public final class IndexedHashMap extends Object {


		private var dicto:Dictionary;
		private var array:Array;

		private var _length:uint;



		/**
		 * Inits the IndexedHashmap.
		 */
		public function IndexedHashMap() {
			super();

			dicto = new Dictionary();
			array = [
			];
		}



		/**
		 * Adds item to the end of the collection.
		 * @param name Name identifier
		 * @param item Object
		 */
		public function addItem(name:String, item:Object):void {
			var ihm:IHMObject = new IHMObject(item, name);

			dicto[name] = ihm;
			array.push(ihm);
			ihm.index = array.length - 1;

			_length++;
		}



		/**
		 * Adds item to specified index, if index is out of bounds we add it to the end of the collection.
		 * @param name Name identifier
		 * @param item Object
		 * @param i Desired item index
		 */
		public function addItemAt(name:String, item:Object, i:int):void {
			var ihm:IHMObject = new IHMObject(item, name);

			dicto[name] = ihm;

			ihm.index = addToArrayAt(i, ihm);

			_length++;
		}



		/**
		 * Removes item specified object reference.
		 * @param item Object reference
		 * @return Boolean false if object wasn't in collection
		 */
		public function removeItem(item:Object):Boolean {
			var i:int = array.indexOf(item);

			if(i == -1) return false;

			var ihm:IHMObject = array[i];

			delete dicto[ihm.name];

			removeFromArrayAt(i);

			_length--;

			return true;
		}



		/**
		 * Removes item specified by item name.
		 * @param name name of object
		 * @return false if object wasn't in collection
		 */
		public function removeItemByName(name:String = null):Boolean {
			if(removeFromArrayAt(array.indexOf(dicto[name]))) {
				delete dicto[name];
				_length--;

				return true;
			}

			return false;
		}



		/**
		 * Removes item specified by index in collection.
		 * @param i item index
		 * @return Boolean false if  object wasn't in collection
		 */
		public function removeItemAt(i:int):Boolean {
			if(i > array.length - 1) return false;

			var ihm:IHMObject = array[i];

			delete dicto[ihm.name];

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
		 * @return Boolean false if item wasn't found in collection
		 */
		public function setItemIndex(targetIndex:int, item:Object = null, itemName:String = null, itemIndex:int = -1):Boolean {
			var o:Object;

			if(item != null) {
				var i:int = array.indexOf(o);

				if(i < 0) return false;

				removeFromArrayAt(i);
				addToArrayAt(targetIndex, o);
			}

			else {
				if(itemName != null) {
					o = dicto[itemName];
					var j:int = array.indexOf(o);

					if(j < 0) return false;

					removeFromArrayAt(j);
					addToArrayAt(targetIndex, o);

					return true;
				}

				else {
					if(itemIndex > 0) {
						o = getItemAt(itemIndex);
						removeFromArrayAt(itemIndex);
						addToArrayAt(targetIndex, o);

						return true;
					}
				}
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
			if(i >= array.length) return null;

			return array[i].item;
		}



		/**
		 * Returns item specified by name
		 * @param s name of item
		 * @return Object item specified by name, null if item wasn't found in collection
		 */
		public function getItemByName(s:String):Object {
			if(dicto[s] == null) return null;

			return dicto[s].item;
		}



		/**
		 * Returns key specified by the item.
		 * @param item item to look for
		 * @return Item key
		 */
		public function getNameByItem(item:Object):String {
			var out:String;

			for each(var i:IHMObject in dicto) {
				if(i.item === item) out = i.name;
			}

			return out;
		}



		/**
		 * @return int number of items in collection
		 */
		public function get length():uint {
			return _length;
		}



		private function removeFromArrayAt(index:int):Boolean {
			if(index >= array.length) return false;

			var a:Array = [
			];
			var i:int;

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

			var a:Array = [
			];
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
