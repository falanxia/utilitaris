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
	import com.falanxia.utilitaris.types.Timestamp;
	import com.falanxia.utilitaris.utils.StringUtils;

	import de.dev_lab.logging.Logger;
	import de.dev_lab.logging.publisher.IPublisher;



	/**
	 * The Array publisher outputs the Log to an Array of Strings.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class ArrayPublisher implements IPublisher {


		private static var dump:Array;

		private var logTimestamp:Boolean;
		private var timestamp:Timestamp;



		public function ArrayPublisher(logTimestamp:Boolean = false) {
			if(dump == null) {
				dump = [
				];
			}

			this.logTimestamp = logTimestamp;

			timestamp = new Timestamp();
		}



		/**
		 * Outputs the message to the String.
		 * @param logLevel Log level
		 * @param object Message
		 */
		public function publish(logLevel:int, object:*, ...additional):void {
			if(logTimestamp) {
				dump[dump.length] = new Timestamp().unixTime + "|" + getPrefix(logLevel) + "  " + StringUtils.removeExtraWhitespace(String(object).replace("\t", "--- "));
			}
			else {
				dump[dump.length] = getPrefix(logLevel) + "  " + StringUtils.removeExtraWhitespace(String(object).replace("\t", "--- "));
			}
		}



		/**
		 * Clears the dump String.
		 */
		public function clear():void {
			dump = [
			];
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			clear();
			timestamp = null;
		}



		/**
		 * Get the dump as Array of Strings
		 * @return Dump Array of Strings
		 */
		public static function getDump():Array {
			return dump;
		}



		public function getLogTimestamp():Boolean {
			return logTimestamp;
		}



		public function setLogTimestamp(logTimestamp:Boolean):void {
			this.logTimestamp = logTimestamp;
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
