/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.communis.events {
	import flash.events.Event;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class CommunisResponseEvent extends Event {


		public var status:uint;
		public var statusMessage:String;
		public var data:Object;
		public var found:int;

		/**
		 * Constructor.
		 */
		public function CommunisResponseEvent(type:String,bubbles:Boolean=false,cancelable:Boolean=false) {
			super(type,bubbles,cancelable);
		}
	}
}
