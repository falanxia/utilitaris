/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.collections {
	import flash.utils.Dictionary;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since
	 */
	public class LengthDictionary {

		private var allowOverwrite:Boolean;
		private var itemCount:uint;
		private var d:Dictionary;



		/**
		 * Constructor.
		 */
		public function LengthDictionary(allowOverwrite:Boolean = true) {
			this.allowOverwrite = allowOverwrite;
			d = new Dictionary();
		}



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



		public function remove(key:String):void {
			if(d[key]) {
				delete d[key];
				itemCount--;
			}
		}



		public function destroy():void {
			d = null;
		}



		public function setOverwrite(b:Boolean):void {
			this.allowOverwrite = b;
		}



		public function getOverwrite():Boolean {
			return allowOverwrite;
		}



		public function getLength():uint {
			return itemCount;
		}



		public function getDictionary():Dictionary {
			return d;
		}



		public function get(key:String):Object {
			return d[key];
		}



	}
}