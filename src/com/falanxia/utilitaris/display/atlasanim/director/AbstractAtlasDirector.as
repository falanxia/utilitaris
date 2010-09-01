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
	import com.falanxia.utilitaris.display.atlasanim.interfaces.*;

	import flash.utils.getTimer;



	/**
	 * Abstract atlas director.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class AbstractAtlasDirector {


		protected var activeAtlasAnims:Vector.<IAtlasAnim>;
		protected var activeAtlasAnimsCount:uint;



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
