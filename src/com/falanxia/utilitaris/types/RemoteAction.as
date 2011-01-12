/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.types {



	/**
	 * Remote action value object.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class RemoteAction {


		/** Action ID */
		public var id:String;

		/** Action argument */
		public var arg:String;



		/**
		 * Constructor.
		 * @param id Action ID
		 * @param arg Action argument
		 */
		public function RemoteAction(id:String, arg:String = null) {
			this.id = id;
			this.arg = arg;
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			id = null;
			arg = null;
		}



		/**
		 * Get the dump.
		 * @return Dump
		 */
		public function toString():String {
			return "RemoteAction: id='" + String(id) + "', arg='" + String(arg) + "'";
		}
	}
}
