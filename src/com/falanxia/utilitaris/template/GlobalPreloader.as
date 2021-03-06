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

package com.falanxia.utilitaris.template {
	import com.falanxia.utilitaris.interfaces.IMain;
	import com.falanxia.utilitaris.utils.ClassUtils;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.external.ExternalInterface;



	/**
	 * Global preloader.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura / Falanxia a.s.
	 */
	public class GlobalPreloader extends MovieClip {


		protected var isLoading:Boolean = true;
		protected var mainClass:Class;
		protected var app:IMain;
		protected var mainClassName:String;
		protected var progress:Number = 0;



		/**
		 * Constructor.
		 * @param mainClassName Main Class name (like "org.vancura.myapp.Main")
		 */
		public function GlobalPreloader(mainClassName:String) {
			this.mainClassName = mainClassName;

			// stop main timeline
			stop();

			// init stage
			stage.showDefaultContextMenu = false;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			// add event listeners
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(Event.RESIZE, onStageResize);
			root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadingError);
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			// remove event listeners
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.removeEventListener(Event.RESIZE, onStageResize);
			root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadingError);

			// jump to next frame
			// first is occupied by the preloader
			nextFrame();

			// find and call main class
			mainClass = ClassUtils.getClassByName(mainClassName);
			if(mainClass === null) {
				// main class not found
				alert("GlobalPreloader: Main class (" + mainClassName + ") not found.\nThis is critical.");
			} else {
				// main class found
				// add it to the display list
				app = new mainClass();
				addChild(DisplayObject(app));

				// send flashvars to main class
				app.flashVars = root.loaderInfo.parameters;

				// run application
				app.start();

				// the app is running now
			}
		}



		/**
		 * Show an alert window if JS enabled. If not, just trace() the message.
		 * @param message Message to be shown
		 */
		public function alert(message:String):void {
			//noinspection UnusedCatchParameterJS
			try {
				// try to display JS alert()
				ExternalInterface.call("alert", message);
			}
			catch(err:Error) {
				// no ExternalInterface available (e.g. app is shown in standalone Flash Player)
				trace(message);
			}
		}



		/**
		 * Load error. Happens when the user navigates somewhere else while Flash is not fully loaded yet.
		 */
		protected function onLoadingError(e:IOErrorEvent):void {
			// don't do anything here
			// app has to silently fail
		}



		/**
		 * Stage resize. Just a placeholder to be overridden by implementations.
		 */
		protected function onStageResize(e:Event = null):void {
		}



		/**
		 * EnterFrame handler. Update your progress bar here.
		 */
		protected function onEnterFrame(e:Event):void {
			progress = 1 / (root.loaderInfo.bytesTotal / root.loaderInfo.bytesLoaded);

			if(progress >= 1) {
				isLoading = false;
				destroy();
			}
		}
	}
}
