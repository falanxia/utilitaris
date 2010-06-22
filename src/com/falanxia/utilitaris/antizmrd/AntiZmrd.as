/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.antizmrd {

	import com.falanxia.utilitaris.antizmrd.checkmethods.ICheckMethod;
	import com.falanxia.utilitaris.antizmrd.disablemethods.IDisableMethod;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class AntiZmrd extends EventDispatcher {

		private var checkMethod:ICheckMethod;
		private var disableMethod:IDisableMethod;

		/**
		 * Constructor.
		 */
		public function AntiZmrd() {}

		public function init(checkMethod:ICheckMethod, disableMethod:IDisableMethod, autoCheck:Boolean = true):void {
			this.checkMethod = checkMethod;
			this.disableMethod = disableMethod;

			if (autoCheck) doCheck();
		}



		public function doCheck():void {
			checkMethod.doCheck();
		}



		public function doDisable():void {
			disableMethod.doDisable();
		}



		public function checkFinished():void {
			dispatchEvent(new Event("complete"));
		}



		public function destroy():void {
			checkMethod.destroy();
			disableMethod.destroy();
		}

	}
}
