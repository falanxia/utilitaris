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

package com.falanxia.utilitaris.types {



	/**
	 * Timestamp.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class Timestamp {


		public static const IMPACT:Number = 1000197986000;

		private var _milliseconds:Number;



		/**
		 * Constructor.
		 * @param milliseconds Milliseconds since 1970
		 */
		public function Timestamp(milliseconds:Number = 0) {
			if(milliseconds == 0) {
				_milliseconds = (new Date()).getTime();
			}
			else {
				_milliseconds = milliseconds;
			}
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Get {@code Date} representation of the timestamp.
		 * @return {@code Date} representation of the timestamp
		 */
		public function get date():Date {
			var d:Date = new Date();

			if(_milliseconds != 0) d.setTime(_milliseconds);

			return d;
		}



		/**
		 * Get UNIX timestamp.
		 * @return UNIX timestamp
		 */
		public function get unixTime():uint {
			return _milliseconds / 1000;
		}



		/**
		 * Set UNIX timestamp.
		 * @param value UNIX timestamp
		 */
		public function set unixTime(value:uint):void {
			_milliseconds = value * 1000;
		}



		/**
		 * Get milliseconds.
		 * @return Milliseconds
		 */
		public function get milliseconds():Number {
			return _milliseconds;
		}



		/**
		 * Set milliseconds.
		 * @param milliseconds Milliseconds
		 */
		public function set milliseconds(milliseconds:Number):void {
			_milliseconds = milliseconds;
		}
	}
}
