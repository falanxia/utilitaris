/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.display.atlasanim.anim {

	import com.falanxia.utilitaris.display.atlasanim.director.IAtlasDirector;
	import com.falanxia.utilitaris.display.atlasanim.events.AtlasAnimEvent;
	import flash.display.BitmapData;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class MCAtlasAnim extends AbstractMultiAtlasAnim implements IAtlasAnim, IMovieClipAnim {


		protected var doPlayForward:Boolean;
		protected var repeat:Boolean;
		protected var doYoyo:Boolean;



		/**
		 * Constructor.
		 */
		public function MCAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>, atlasesLengths:Array,
		                            atlasDirector:IAtlasDirector) {
			super(width, height, atlases, atlasesLengths, atlasDirector);

			frame = -1;
			doPlayForward = true;
			repeat = true;
			doYoyo = false;
		}



		public function update():void {
			increaseFrames();
			this.drawFrame(frame);
		}



		public function play(dontWaitForDirector:Boolean = false):void {
			if(dontWaitForDirector) {
				this.update();
			}

			if(frame == 0 && !doPlayForward) frame = maxFrame + 1;
			if(frame == maxFrame && doPlayForward) frame = -1;
			director.registerAnim(this);
		}



		public function stop():void {
			director.unregisterAnim(this);
		}



		public function gotoAndPlay(frame:uint):void {
			this.frame = frame;
			checkFrames();
			director.registerAnim(this);
		}



		public function gotoAndStop(frame:uint):void {
			director.unregisterAnim(this);
			this.frame = frame;
			checkFrames();
			this.drawFrame(frame);
		}



		public function nextFrame():void {
			this.frame++;
			checkFrames();
			this.drawFrame(frame);
		}



		public function prevFrame():void {
			this.frame--;
			checkFrames();
			this.drawFrame(frame);
		}



		public function reverse():void {
			this.doPlayForward = !this.doPlayForward;
		}



		public function goto(frame:uint):void {
			this.frame = frame;
			checkFrames();
			this.drawFrame(frame);
		}


		override public function destroy():void {
			director.unregisterAnim(this);
			super.destroy();
		}



		public function setYoyo(doYoyo:Boolean):void {
			this.doYoyo = doYoyo;
		}



		public function getYoyo():Boolean {
			return doYoyo;
		}



		public function setDirection(doPlayForward:Boolean):void {
			this.doPlayForward = doPlayForward;
		}



		public function getDirection():Boolean {
			return false;
		}



		public function getRepeat():Boolean {
			return repeat;
		}



		public function setRepeat(repeat:Boolean):void {
			this.repeat = repeat;
		}



		public function getFrameNum():uint {
			return maxFrame+1;
		}




		protected function increaseFrames():void {
			if(this.doPlayForward) {
				frame++;
				checkMaxFrame();
			}
			else {
				frame--;
				checkMinFrame();
			}
		}



		protected function checkFrames():void {
			if(this.doPlayForward) {
				checkMaxFrame();
			}
			else {
				checkMinFrame();
			}
		}



		protected function checkMinFrame():void {
			if(frame < 0) {

				if(!repeat) {
					this.director.unregisterAnim(this);
					this.frame = 0;
				}
				else {
					if(doYoyo) {
						this.reverse();
						frame = 1;
					}
					else {
						frame = maxFrame;
					}
				}

				dispatchEvent(new AtlasAnimEvent(AtlasAnimEvent.ANIM_FIRST_FRAME));
			}
		}



		protected function checkMaxFrame():void {
			if(frame > maxFrame) {

				if(!repeat) {
					this.director.unregisterAnim(this);
					this.frame = maxFrame;
				}
				else {
					if(doYoyo) {
						this.reverse();
						this.frame = maxFrame - 1;
					}
					else {
						frame = 0;
					}
				}

				dispatchEvent(new AtlasAnimEvent(AtlasAnimEvent.ANIM_LAST_FRAME));
			}
		}


	}

}
