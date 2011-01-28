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
	import flash.utils.Dictionary;



	/**
	 * Length dictionary.
	 *
	 * @author Jakub Schimer / Falanxia a.s.
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class LengthDictionary {


		private var allowOverwrite:Boolean;
		private var itemCount:uint;
		private var d:Dictionary;



		/**
		 * Constructor.
		 * @param allowOverwrite true to allow overwriting
		 */
		public function LengthDictionary(allowOverwrite:Boolean = true) {
			this.allowOverwrite = allowOverwrite;

			d = new Dictionary();
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			d = null;
		}



		/**
		 * Add an item.
		 * @param key Key
		 * @param item Item
		 */
		public function add(key:String, item:Object):void {
			if(d[key]) {
				if(allowOverwrite) {
					d[key] = item;
				}
			}

			else {
				d[key] = item;
				itemCount++;
			}
		}



		/**
		 * Remove the item.
		 * @param key Key
		 */
		public function remove(key:String):void {
			if(d[key]) {
				delete d[key];
				itemCount--;
			}
		}



		/**
		 * Set overwrite flag.
		 * @param value true to enable overwriting
		 */
		public function setOverwrite(value:Boolean):void {
			this.allowOverwrite = value;
		}



		/**
		 * Get overwrite flag.
		 * @return true if overwriting is enabled
		 */
		public function getOverwrite():Boolean {
			return allowOverwrite;
		}



		/**
		 * Get count of items stored in the dictionary.
		 * @return Count
		 */
		public function getLength():uint {
			return itemCount;
		}



		/**
		 * Get the dictionary.
		 * @return Dictionary
		 */
		public function getDictionary():Dictionary {
			return d;
		}



		/**
		 * Get an object stored in the dictionary via its key.
		 * @param key Key
		 * @return Object
		 */
		public function get(key:String):Object {
			return d[key];
		}
	}
}
