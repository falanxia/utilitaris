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
	import de.dev_lab.logging.*;
	import de.dev_lab.logging.publisher.*;



	/**
	 * The String publisher outputs the Log to a String.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class StringPublisher implements IPublisher {


		private static var dump:String;



		/**
		 * Constructor.
		 */
		public function StringPublisher() {
			if(dump == null) dump = new String();
		}



		/**
		 * Outputs the message to the String.
		 * @param logLevel Log level
		 * @param object Message
		 */
		public function publish(logLevel:int, object:*, ...additional):void {
			dump += getPrefix(logLevel) + "  " + String(object) + "\n";
		}



		/**
		 * Clears the dump String.
		 */
		public function clear():void {
			dump = "";
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			clear();
		}



		/**
		 * Get the dump String
		 * @return Dump String
		 */
		public static function toString():String {
			return dump;
		}



		/**
		 * Returns a special prefix for trace output.
		 * @param logLevel Log level
		 * @return Prefix
		 */
		private function getPrefix(logLevel:int):String {
			switch(logLevel) {
				case Logger.INFO :
					return "★";

				case Logger.WARN :
					return "☀";

				case Logger.ERROR :
					return "⚑";

				case Logger.FATAL :
					return "✖";

				default:
					return " ";
			}
		}
	}
}
