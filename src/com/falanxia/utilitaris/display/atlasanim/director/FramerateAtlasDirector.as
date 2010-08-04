/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.display.atlasanim.director {

	import flash.display.Stage;
	import flash.events.Event;

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class FramerateAtlasDirector extends AbstractAtlasDirector implements IAtlasDirector {

		private var stage:Stage;

		/**
		 * Constructor.
		 */
		public function FramerateAtlasDirector(stage:Stage) {
			super();
			this.stage = stage;
		}



		public function start():void {
			this.stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}



		public function stop():void {
			this.stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}



		override public function destroy(destroyAssociatedAnims:Boolean = true):void {
			super.destroy(destroyAssociatedAnims);
			this.stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage = null;
		}



		private function onEnterFrame(e:Event):void {
			this.updateAnims();
		}
	}
}
