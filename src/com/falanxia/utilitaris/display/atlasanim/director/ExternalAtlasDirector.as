/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.display.atlasanim.director {

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class ExternalAtlasDirector extends AbstractAtlasDirector implements IAtlasDirector {

		private var isRunning:Boolean;

		/**
		 * Constructor.
		 */
		public function ExternalAtlasDirector() {
			super();
		}



		public function start():void {
			isRunning = true;
		}



		public function stop():void {
			isRunning = false;
		}



		public function update():void {
			if(isRunning) {
				this.updateAnims();
			}
		}
	}
}
