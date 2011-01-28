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
	import com.falanxia.utilitaris.types.Timestamp;
	import com.falanxia.utilitaris.utils.StringUtils;

	import de.dev_lab.logging.Logger;
	import de.dev_lab.logging.publisher.IPublisher;



	/**
	 * The String publisher outputs the Log to a String.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class StringPublisher implements IPublisher {


		private static var instance:StringPublisher;

		private var timestamp:Timestamp;

		private var _dump:String;
		private var _logTimestamp:Boolean;



		/**
		 * Constructor.
		 */
		public function StringPublisher(s:Senf) {
			if(s == null) throw new Error("StringPublisher is singleton, use getInstance() method");
		}



		/**
		 * Singleton acces method
		 * @return Instance of the StringPublisher singleton.
		 */
		public static function getInstance():StringPublisher {
			if(instance == null) instance = new StringPublisher(new Senf());

			return instance;
		}



		/**
		 * Initialize publisher.
		 * @param logTimestamp true to log timestamps
		 */
		public function init(logTimestamp:Boolean = false):void {
			if(_dump == null) {
				_dump = new String();
			}

			_logTimestamp = logTimestamp;

			timestamp = new Timestamp();
		}



		/**
		 * Outputs the message to the String.
		 * @param logLevel Log level
		 * @param object Message
		 */
		public function publish(logLevel:int, object:*, ...additional):void {
			if(_logTimestamp) {
				_dump += new Timestamp().unixTime + "|" + getPrefix(logLevel) + "  " + StringUtils.removeExtraWhitespace(String(object).replace("\t", "--- ")) + "\n";
			} else {
				_dump += getPrefix(logLevel) + "  " + StringUtils.removeExtraWhitespace(String(object).replace("\t", "--- ")) + "\n";
			}
		}



		/**
		 * Clears the dump String.
		 */
		public function clear():void {
			_dump = "";
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			clear();
			timestamp = null;
		}



		/**
		 * Get the dump String
		 * @return Dump String
		 */
		public function get dump():String {
			return _dump;
		}



		/**
		 * Get timestamp logging flag.
		 * @return true if timestamp logging is enabled
		 */
		public function get logTimestamp():Boolean {
			return _logTimestamp;
		}



		/**
		 * Set timestamp logging flag.
		 * @param value true if timestamp logging is enabled
		 */
		public function set logTimestamp(value:Boolean):void {
			_logTimestamp = value;
		}



		/**
		 * Returns a special prefix for trace output.
		 * @param logLevel Log level
		 * @return Prefix
		 */
		private function getPrefix(logLevel:int):String {
			switch(logLevel) {
				case Logger.INFO :
					return "(--) ";

				case Logger.WARN :
					return "(ww) ";

				case Logger.ERROR :
					return "(ee) ";

				case Logger.FATAL :
					return "(!!) ";

				default:
					return "     ";
			}
		}
	}
}



class Senf {
}
