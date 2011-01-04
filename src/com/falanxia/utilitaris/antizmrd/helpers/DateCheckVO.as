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

package com.falanxia.utilitaris.antizmrd.helpers {



	/**
	 * DateCheckVO.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class DateCheckVO {


		//0-n
		private var _year:Number;
		//1-12
		private var _month:Number;
		//1-31
		private var _day:Number;
		//0-23
		private var _hour:Number;
		//0-59
		private var _minute:Number;
		//0-59
		private var _second:Number;



		public function DateCheckVO(year:Number, month:Number, day:Number, hour:Number = 0, minute:Number = 0, second:Number = 0) {
			_year = year;
			_month = month - 1;
			_day = day;
			_hour = hour;
			_minute = minute;
			_second = second;
		}



		public function get year():Number {
			return _year;
		}



		public function get month():Number {
			return _month;
		}



		public function get day():Number {
			return _day;
		}



		public function get hour():Number {
			return _hour;
		}



		public function get minute():Number {
			return _minute;
		}



		public function get second():Number {
			return _second;
		}



		public function set year(value:Number):void {
			_year = value;
		}



		public function set month(value:Number):void {
			_month = value - 1;
		}



		public function set day(value:Number):void {
			_day = value;
		}



		public function set hour(value:Number):void {
			_hour = value;
		}



		public function set minute(value:Number):void {
			_minute = value;
		}



		public function set second(value:Number):void {
			_second = value;
		}
	}
}
