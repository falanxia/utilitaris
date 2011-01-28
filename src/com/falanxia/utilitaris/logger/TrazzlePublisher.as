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

package com.falanxia.utilitaris.logger {
	import com.falanxia.utilitaris.utils.StringUtils;
	import com.nesium.logging.TrazzleLogger;

	import de.dev_lab.logging.Logger;
	import de.dev_lab.logging.publisher.IPublisher;

	import flash.display.Stage;



	/**
	 * The String publisher outputs the Log to a Trazzle.
	 * See more info about Trazzle here: http://www.nesium.com/products/trazzle
	 *
	 * @author Vaclav Vancura / Falanxia a.s.
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class TrazzlePublisher implements IPublisher {


		private static var instance:TrazzlePublisher;

		private var _trazzle:TrazzleLogger;



		/**
		 * Constructor.
		 */
		public function TrazzlePublisher(s:Senf) {
			if(s == null) throw new Error("TrazzlePublisher is singleton, use getInstance() method");
		}



		/**
		 * Singleton acces method
		 * @return Instance of the TrazzlePublisher singleton.
		 */
		public static function getInstance():TrazzlePublisher {
			if(instance == null) instance = new TrazzlePublisher(new Senf());

			return instance;
		}



		/**
		 * Initialize publisher.
		 * @param stageReference Stage reference
		 * @param appName Application name
		 */
		public function init(stageReference:Stage, appName:String):void {
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
		public function get trazzle():TrazzleLogger {
			return _trazzle;
		}
	}
}



class Senf {
}
