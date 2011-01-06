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

package com.falanxia.utilitaris.antizmrd.checkmethods {
	import com.falanxia.utilitaris.antizmrd.AntiZmrd;

	import flash.events.TimerEvent;
	import flash.utils.Timer;



	/**
	 * TimeOutCheck.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class TimeOutCheck extends AbstractCheckMethod implements ICheckMethod {


		private var disableTime:Number;
		private var disableTimer:Timer;



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
