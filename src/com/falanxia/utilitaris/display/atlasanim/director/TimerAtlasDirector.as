/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.display.atlasanim.director {
	import de.dev_lab.logging.Logger;

	import flash.events.TimerEvent;
	import flash.utils.Timer;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class TimerAtlasDirector extends AbstractAtlasDirector implements IAtlasDirector {

		private var timer:Timer;

		/**
		 * Constructor.
		 */
		public function TimerAtlasDirector(refreshRate:Number) {
			super();

			timer = new Timer(refreshRate);
		}



		public function start():void {
			timer.addEventListener(TimerEvent.TIMER, onTimerTick);
			timer.start();
		}



		public function stop():void {
			timer.removeEventListener(TimerEvent.TIMER, onTimerTick);
			timer.stop();
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
