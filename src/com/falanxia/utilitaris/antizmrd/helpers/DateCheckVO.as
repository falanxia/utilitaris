	package com.falanxia.utilitaris.antizmrd.helpers {

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
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

		/**
		 * Constructor.
		 */
		public function DateCheckVO(year:Number, month:Number, day:Number, hour:Number = 0, minute:Number = 0, second:Number = 0) {
			this._year = year;
			this._month = month - 1;
			this._day = day;
			this._hour = hour;
			this._minute = minute;
			this._second = second;
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
