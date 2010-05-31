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


package com.falanxia.utilitaris.display {
	import flash.display.*;



	/**
	 * Global Stage singleton.
	 *
	 * @implementationNote Original: <a href="http://www.kirupa.com/forum/showthread.php?p=1939920">http://www.kirupa.com/forum/showthread.php?p=1939920</a>
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Matthew Lloyd (<a href="http://matt-lloyd.co.uk">matt-lloyd.co.uk</a>)
	 * @since 1.0
	 */
	public class GlobalStage extends Sprite {


		private static var instance:GlobalStage = null;



		/**
		 * Init global {@code Stage} singleton.
		 * @param value {@code Stage}
		 */
		public static function init(value:Stage):void {
			value.addChild(GlobalStage.getInstance());
		}



		/**
		 * Get an instance.
		 * @return GlobalStage instance
		 */
		public static function getInstance():GlobalStage {
			if(instance == null) instance = new GlobalStage();
			return instance;
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Get global {@code Stage} reference.
		 * @return Global {@code Stage} reference
		 */
		public static function get stage():Stage {
			return getInstance().stage;
		}
	}
}
