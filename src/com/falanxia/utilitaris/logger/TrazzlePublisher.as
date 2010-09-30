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

package com.falanxia.utilitaris.logger {
	import com.falanxia.utilitaris.utils.*;
	import com.nesium.logging.*;

	import de.dev_lab.logging.*;
	import de.dev_lab.logging.publisher.*;

	import flash.display.*;



	/**
	 * The String publisher outputs the Log to a Trazzle.
	 * See more info about Trazzle here: http://www.nesium.com/products/trazzle
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class TrazzlePublisher implements IPublisher {

		private static var _trazzle:TrazzleLogger;

		/**
		 * Constructor.
		 */
		public function TrazzlePublisher(stageReference:Stage, appName:String) {
			if(_trazzle == null) {
				_trazzle = new TrazzleLogger();
				_trazzle.setParams(stageReference, appName);
			}
		}



		/**
		 * Outputs the message to the String.
		 * @param logLevel Log level
		 * @param object Message
		 */
		public function publish(logLevel:int, object:*, ...additional):void {
			var prefix:String;

			switch(logLevel) {
				case Logger.DEBUG:
					prefix = "d ";
					break;

				case Logger.INFO:
					prefix = "i ";
					break;

				case Logger.WARN:
					prefix = "w ";
					break;

				case Logger.ERROR:
					prefix = "e ";
					break;

				case Logger.FATAL:
					prefix = "f ";
					break;

				default:
					prefix = "";
			}

			if(object == null) object = "[null]";

			_trazzle.log(prefix + StringUtils.trim(String(object)), 4);
		}



		/**
		 * Clear.
		 * Trazzle has no clear method, so it's just a placeholder.
		 */
		public function clear():void {
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			clear();
		}



		/**
		 * Get Trazzle reference.
		 * @return Reference to Trazzle
		 */
		public static function get trazzle():TrazzleLogger {
			return _trazzle;
		}
	}
}
