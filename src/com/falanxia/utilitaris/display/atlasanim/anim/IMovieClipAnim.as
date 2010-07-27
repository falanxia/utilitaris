/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.display.atlasanim.anim {

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
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


	}
}
