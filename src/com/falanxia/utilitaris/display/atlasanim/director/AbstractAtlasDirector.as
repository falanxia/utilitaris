/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.display.atlasanim.director {
	import com.falanxia.utilitaris.display.atlasanim.anim.IAtlasAnim;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class AbstractAtlasDirector {

		protected var activeAtlasAnims:Vector.<IAtlasAnim>;
		protected var activeAtlasAnimsCount:uint;



		/**
		 * Constructor.
		 */
		public function AbstractAtlasDirector() {
			activeAtlasAnims = new Vector.<IAtlasAnim>();
		}



		public function registerAnim(atlasAnim:IAtlasAnim):Boolean {
			if(activeAtlasAnims.indexOf(atlasAnim) == -1) {
				activeAtlasAnims.push(atlasAnim);
				activeAtlasAnimsCount++;
				return true;
			}

			return false;
		}



		public function unregisterAnim(atlasAnim:IAtlasAnim):Boolean {
			var i:int = activeAtlasAnims.indexOf(atlasAnim);

			if(i > -1) {
				activeAtlasAnims.splice(i, 1);
				activeAtlasAnimsCount--;
				return true;
			}

			return false;
		}



		public function unregisterAll():void {
			this.activeAtlasAnims.splice(0, activeAtlasAnims.length);
			activeAtlasAnimsCount = 0;
		}



		public function destroy(destroyAssociatedAnims:Boolean = true):void {
			if(destroyAssociatedAnims) {
				for(var i:int = 0; i < activeAtlasAnimsCount; i++) {
					activeAtlasAnims[i].destroy();
				}
			}
			activeAtlasAnims = null;
			activeAtlasAnimsCount = 0;
		}



		protected function updateAnims():void {
			for(var i:int; i < activeAtlasAnimsCount; i++) {
				activeAtlasAnims[i].update();
			}
		}


	}

}
