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

package com.falanxia.utilitaris.display.atlasanim.anim {
	import com.falanxia.utilitaris.display.atlasanim.events.AtlasAnimEvent;
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasAnim;
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasDirector;
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IMovieClipAnim;

	import flash.display.BitmapData;



	/**
	 * Atlas animation.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class MCAtlasAnim extends AbstractMultiAtlasAnim implements IAtlasAnim, IMovieClipAnim {


		protected var doPlayForward:Boolean;
		protected var repeat:Boolean;
		protected var doYoyo:Boolean;
		protected var limitMinFrame:int;
		protected var limitMaxFrame:int;



		/**
		 * Constructor.
		 * @param width Animation width
		 * @param height Animation height
		 * @param atlases Atlas list
		 * @param atlasesLengths Atlas frame count
		 * @param atlasDirector IAtlasDirector reference
		 * @see IAtlasDirector
		 */
		public function MCAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>, atlasesLengths:Array, atlasDirector:IAtlasDirector) {
			super(width, height, atlases, atlasesLengths, atlasDirector);

			frame = -1;
			limitMinFrame = 0;
			limitMaxFrame = this.maxFrame;

			doPlayForward = true;
			repeat = true;
			doYoyo = false;
		}



		/**
		 * Destructor.
		 */
		override public function destroy():void {
			director.unregisterAnim(this);

			super.destroy();
		}



		/**
		 * Update the animation.
		 */
		public function update():void {
			increaseFrames();
			this.drawFrame(frame);
		}



		/**
		 * Play the animation.
		 * @param dontWaitForDirector true to skip waiting for the director.
		 * @see IAtlasDirector
		 */
		public function play(dontWaitForDirector:Boolean = false):void {
			if(dontWaitForDirector) {
				this.update();
			}

			if(frame == limitMinFrame && !doPlayForward) frame = limitMaxFrame + 1;
			if(frame == limitMaxFrame && doPlayForward) frame = limitMinFrame - 1;

			director.registerAnim(this);
		}



		/**
		 * Stop the animation.
		 */
		public function stop():void {
			director.unregisterAnim(this);
		}



		/**
		 * Go to a frame and play.
		 * @param frame Frame to jump to
		 */
		public function gotoAndPlay(frame:uint):void {
			this.frame = frame;
			checkFrames();
			director.registerAnim(this);
		}



		/**
		 * Go to a frame and stop.
		 * @param frame Frame to jump to
		 */
		public function gotoAndStop(frame:uint):void {
			director.unregisterAnim(this);
			this.frame = frame;
			checkFrames();
			this.drawFrame(frame);
		}



		/**
		 * Jump to the next frame.
		 */
		public function nextFrame():void {
			this.frame++;
			checkFrames();
			this.drawFrame(frame);
		}



		/**
		 * Jump to the previous frame.
		 */
		public function prevFrame():void {
			this.frame--;
			checkFrames();
			this.drawFrame(frame);
		}



		/**
		 * Reverse animation playback.
		 */
		public function reverse():void {
			this.doPlayForward = !this.doPlayForward;
		}



		/**
		 * Go to a frame and stop.
		 * @param frame Frame to jump to
		 * TODO: Check and compare with gotoAndStop()
		 */
		public function goto(frame:uint):void {
			this.frame = frame;
			checkFrames();
			this.drawFrame(frame);
		}



		/**
		 * Set yoyo playback mode.
		 * @param doYoyo true for yoyo
		 */
		public function setYoyo(doYoyo:Boolean):void {
			this.doYoyo = doYoyo;
		}



		/**
		 * Get yoyo playback mode.
		 * @return true for yoyo
		 */
		public function getYoyo():Boolean {
			return doYoyo;
		}



		/**
		 * Set playback direction
		 * @param doPlayForward true to play forward
		 */
		public function setDirection(doPlayForward:Boolean):void {
			this.doPlayForward = doPlayForward;
		}



		/**
		 * Get playback direction
		 * @return true for forward playback
		 */
		public function getDirection():Boolean {
			return this.doPlayForward;
		}



		/**
		 * Get repeat playback mode.
		 * @return true for repeat mode
		 */
		public function getRepeat():Boolean {
			return this.repeat;
		}



		/**
		 * Set repeat playback mode.
		 * @param repeat true for repeat mode
		 */
		public function setRepeat(repeat:Boolean):void {
			this.repeat = repeat;
		}



		/**
		 * Get frame number.
		 * @return Frame number
		 */
		public function getFrameNum():uint {
			return maxFrame + 1;
		}



		/**
		 * Set frame limits.
		 * @param minFrame Low frame
		 * @param maxFrame High frame
		 * @param jumpToFrame true to jump to frame if cropped
		 */
		public function setFrameLimit(minFrame:uint, maxFrame:uint, jumpToFrame:Boolean = false):void {
			if(minFrame > 0) {
				this.limitMinFrame = minFrame;
			} else {
				this.limitMinFrame = 0;
			}

			if(maxFrame < this.maxFrame) {
				this.limitMaxFrame = maxFrame;
			} else {
				this.limitMaxFrame = this.maxFrame;
			}

			if(jumpToFrame) frame = minFrame;
		}



		protected function increaseFrames():void {
			if(this.doPlayForward) {
				frame++;
				checkMaxFrame();
			} else {
				frame--;
				checkMinFrame();
			}
		}



		protected function checkFrames():void {
			if(this.doPlayForward) {
				checkMaxFrame();
			} else {
				checkMinFrame();
			}
		}



		protected function checkMinFrame():void {
			if(frame < limitMinFrame) {
				if(repeat) {
					if(doYoyo) {
						this.reverse();
						frame = limitMinFrame + 1;
					} else {
						frame = limitMaxFrame;
					}
				} else {
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
					} else {
						frame = limitMinFrame;
					}
				} else {
					this.director.unregisterAnim(this);
					this.frame = limitMaxFrame;
				}

				dispatchEvent(new AtlasAnimEvent(AtlasAnimEvent.ANIM_LAST_FRAME));
			}
		}
	}
}
