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

package com.falanxia.utilitaris.display.atlasanim.interfaces {



	/**
	 * MovieClip animation interface.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public interface IMovieClipAnim {


		function play(dontWaitForDirector:Boolean = false):void;



		function stop():void;



		function reverse():void;



		function goto(frame:uint):void;



		function gotoAndPlay(frame:uint):void;



		function gotoAndStop(frame:uint):void;



		function nextFrame():void;



		function prevFrame():void;



		function destroy():void;



		function setDirection(doPlayForward:Boolean):void;



		function getDirection():Boolean;



		function getRepeat():Boolean;



		function setRepeat(repeat:Boolean):void;



		function setYoyo(doYoyo:Boolean):void;



		function getYoyo():Boolean;



		function getFrameNum():uint;



		function setFrameLimit(minFrame:uint, maxFrame:uint, jumpToFrame:Boolean = false):void;


	}
}
