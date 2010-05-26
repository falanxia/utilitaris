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

package com.falanxia.utilitaris.plugins {
	import com.greensock.*;
	import com.greensock.plugins.*;



	/**
	 * Dummy tween plugin.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class DummyTweenPlugin extends TweenPlugin {


		public static const API:Number = 1.0;

		protected var _target:Object;



		/**
		 * Constructor.
		 */
		public function DummyTweenPlugin() {
			super();
			this.propName = "dummy";
			this.overwriteProps = ["dummy"];
		}



		/**
		 * Tween initialization.
		 * Gets called when any tween of the special property begins. Store any initial values
		 * and/or variables that will be used in the "changeFactor" setter when this method runs.
		 * @param target Target object of the TweenLite instance using this plugin
		 * @param value The value that is passed in through the special property in the tween.
		 * @param tween The TweenLite or TweenMax instance using this plugin.
		 * @return If the initialization failed, it returns false. Otherwise true. It may fail if, for example, the plugin requires that the target be a DisplayObject or has some other unmet criteria in which case the plugin is skipped and a normal property tween is used inside TweenLite
		 */
		override public function onInitTween(target:Object, value:*, tween:TweenLite):Boolean {
			return true;
		}
	}
}
