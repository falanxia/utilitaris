/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.antizmrd.checkmethods {



	import com.falanxia.utilitaris.antizmrd.AntiZmrd;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since 1.0
	 */
	public class TimeOutCheck extends AbstractCheckMethod implements ICheckMethod {

		private var disableTime:Number;
		private var disableTimer:Timer;

		/**
		 * Constructor.
		 */
		public function TimeOutCheck(antiZmrd:AntiZmrd, disableTime:Number) {
			super(antiZmrd);
			this.disableTime = disableTime;
		}

		public function doCheck():void {
			disableTimer = new Timer(disableTime, 1);
			disableTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			disableTimer.start();
		}



		public function destroy():void {
			disableTimer = null;
		}


		private function onTimerComplete(e:TimerEvent):void {
			disableTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			disableApplication();
		}


	}

}
