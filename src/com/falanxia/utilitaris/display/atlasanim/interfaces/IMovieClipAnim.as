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

package com.falanxia.utilitaris.display.atlasanim.interfaces {



	/**
	 * MovieClip animation interface.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public interface IMovieClipAnim {



		/**
		 * Play the animation.
		 * @param dontWaitForDirector true to skip waiting for the director.
		 */
		function play(dontWaitForDirector:Boolean = false):void;



		/**
		 * Stop the animation.
		 */
		function stop():void;



		/**
		 * Reverse animation playback.
		 */
		function reverse():void;



		/**
		 * Go to a frame and stop.
		 * @param frame Frame to jump to
		 * TODO: Check and compare with gotoAndStop()
		 */
		function goto(frame:uint):void;



		/**
		 * Go to a frame and play.
		 * @param frame Frame to jump to
		 */
		function gotoAndPlay(frame:uint):void;



		/**
		 * Go to a frame and stop.
		 * @param frame Frame to jump to
		 */
		function gotoAndStop(frame:uint):void;



		/**
		 * Jump to the next frame.
		 */
		function nextFrame():void;



		/**
		 * Jump to the previous frame.
		 */
		function prevFrame():void;



		/**
		 * Set playback direction
		 * @param doPlayForward true to play forward
		 */
		function setDirection(doPlayForward:Boolean):void;



		/**
		 * Get playback direction
		 * @return true for forward playback
		 */
		function getDirection():Boolean;



		/**
		 * Get repeat playback mode.
		 * @return true for repeat mode
		 */
		function getRepeat():Boolean;



		/**
		 * Set repeat playback mode.
		 * @param repeat true for repeat mode
		 */
		function setRepeat(repeat:Boolean):void;



		/**
		 * Set yoyo playback mode.
		 * @param doYoyo true for yoyo
		 */
		function setYoyo(doYoyo:Boolean):void;



		/**
		 * Get yoyo playback mode.
		 * @return true for yoyo
		 */
		function getYoyo():Boolean;



		/**
		 * Get frame number.
		 * @return Frame number
		 */
		function getFrameNum():uint;



		/**
		 * Set frame limits.
		 * @param minFrame Low frame
		 * @param maxFrame High frame
		 * @param jumpToFrame true to jump to frame if cropped
		 */
		function setFrameLimit(minFrame:uint, maxFrame:uint, jumpToFrame:Boolean = false):void;


	}
}
