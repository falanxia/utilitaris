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

package com.falanxia.utilitaris.display.atlasanim.anim {
	import com.falanxia.utilitaris.display.atlasanim.events.*;
	import com.falanxia.utilitaris.display.atlasanim.interfaces.*;

	import flash.display.*;



	/**
	 * Atlas animation.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class MCAtlasAnim extends AbstractMultiAtlasAnim implements IAtlasAnim, IMovieClipAnim {


		protected var doPlayForward:Boolean;
		protected var repeat:Boolean;
		protected var doYoyo:Boolean;
		protected var limitMinFrame:int;
		protected var limitMaxFrame:int;



		public function MCAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>, atlasesLengths:Array, atlasDirector:IAtlasDirector) {
			super(width, height, atlases, atlasesLengths, atlasDirector);

			frame = -1;
			limitMinFrame = 0;
			limitMaxFrame = this.maxFrame;

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

			if(frame == limitMinFrame && !doPlayForward) frame = limitMaxFrame + 1;
			if(frame == limitMaxFrame && doPlayForward) frame = limitMinFrame - 1;

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
			return this.doPlayForward;
		}



		public function getRepeat():Boolean {
			return this.repeat;
		}



		public function setRepeat(repeat:Boolean):void {
			this.repeat = repeat;
		}



		public function getFrameNum():uint {
			return maxFrame + 1;
		}



		public function setFrameLimit(minFrame:uint, maxFrame:uint):void {
			if(minFrame > 0) {
				this.limitMinFrame = minFrame;
			}
			else {
				this.limitMinFrame = 0;
			}

			if(maxFrame < this.maxFrame) {
				this.limitMaxFrame = maxFrame;
			}
			else {
				this.limitMaxFrame = this.maxFrame;
			}
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
			if(frame < limitMinFrame) {
				if(repeat) {
					if(doYoyo) {
						this.reverse();
						frame = limitMinFrame + 1;
					}
					else {
						frame = limitMaxFrame;
					}
				}
				else {
					this.director.unregisterAnim(this);
					this.frame = limitMinFrame;
				}

				dispatchEvent(new AtlasAnimEvent(AtlasAnimEvent.ANIM_FIRST_FRAME));
			}
		}



		protected function checkMaxFrame():void {
			if(frame > limitMaxFrame) {
				if(repeat) {
					if(doYoyo) {
						this.reverse();
						this.frame = limitMaxFrame - 1;
					}
					else {
						frame = limitMinFrame;
					}
				}
				else {
					this.director.unregisterAnim(this);
					this.frame = limitMaxFrame;
				}

				dispatchEvent(new AtlasAnimEvent(AtlasAnimEvent.ANIM_LAST_FRAME));
			}
		}
	}
}
