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

package com.falanxia.utilitaris.display.atlasanim.director {
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasDirector;

	import flash.events.TimerEvent;
	import flash.utils.Timer;



	/**
	 * Timer atlas director.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class TimerAtlasDirector extends AbstractAtlasDirector implements IAtlasDirector {


		private var timer:Timer;



		public function TimerAtlasDirector(refreshRate:Number) {
			super();
			timer = new Timer(refreshRate);
		}



		override public function start():void {
			timer.addEventListener(TimerEvent.TIMER, onTimerTick);
			timer.start();

			super.start();
		}



		override public function stop():void {
			timer.removeEventListener(TimerEvent.TIMER, onTimerTick);
			timer.stop();

			super.stop()
		}



		override public function destroy(destroyAssociatedAnims:Boolean = true):void {
			super.destroy(destroyAssociatedAnims);
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTimerTick);
			timer = null;
		}



		private function onTimerTick(e:TimerEvent):void {
			this.updateAnims();
		}
	}
}
