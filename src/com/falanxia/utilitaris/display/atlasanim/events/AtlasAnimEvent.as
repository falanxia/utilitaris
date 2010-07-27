
/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.display.atlasanim.events {
	import flash.events.Event;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class AtlasAnimEvent extends Event {

		public static const ANIM_LAST_FRAME:String = "atlasAnimLastFrame";
		public static const ANIM_FIRST_FRAME:String = "atlasAnimFirstFrame";

		/**
		 * Constructor.
		 */
		public function AtlasAnimEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}
