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
	public class CommunisErrorEvent extends Event {

		public static const ERROR:String = 'commError';

		public var errorMessage:String;

		/**
		 * Constructor.
		 */
		public function CommunisErrorEvent(type:String,bubbles:Boolean=false,cancelable:Boolean=false) {
			super(type,bubbles,cancelable);
		}
	}
}
