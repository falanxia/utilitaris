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

package com.falanxia.utilitaris.utils {



	/**
	 * Date utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class DateUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function DateUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Formats a {@code Date} object for display. Acts almost identically to the PHP {@code date()} function.
		 * <table border="1">
		 *      <tr>
		 *          <th style="width:150px;">Format character</th>
		 *          <th>Description</th>
		 *          <th style="width:200px;">Example returned values</th>
		 *      </tr>
		 *      <tr>
		 *          <td>d</td>
		 *          <td>Day of the month, 2 digits with leading zeros.</td>
		 *          <td>01 to 31</td>
		 *      </tr>
		 *      <tr>
		 *          <td>D</td>
		 *          <td>A textual representation of a day, three letters.</td>
		 *          <td>Mon through Sun</td>
		 *      </tr>
		 *      <tr>
		 *          <td>j</td>
		 *          <td>Day of the month without leading zeros.</td>
		 *          <td>1 to 31</td>
		 *      </tr>
		 *      <tr>
		 *          <td>l</td>
		 *          <td>A full textual representation of the day of the week.</td>
		 *          <td>Sunday through Saturday</td>
		 *      </tr>
		 *      <tr>
		 *          <td>N</td>
		 *          <td>ISO-8601 numeric representation of the day of the week.</td>
		 *          <td>1 (for Monday) through 7 (for Sunday)</td>
		 *      </tr>
		 *      <tr>
		 *          <td>S</td>
		 *          <td>English ordinal suffix for the day of the month, 2 characters.</td>
		 *          <td>st, nd, rd or th</td>
		 *      </tr>
		 *      <tr>
		 *          <td>w</td>
		 *          <td>Numeric representation of the day of the week.</td>
		 *          <td>0 (for Sunday) through 6 (for Saturday)</td>
		 *      </tr>
		 *      <tr>
		 *          <td>z</td>
		 *          <td>The day of the year (starting from 0).</td>
		 *          <td>0 through 365</td>
		 *      </tr>
		 *      <tr>
		 *          <td>W</td>
		 *          <td>ISO-8601 week number of year, weeks starting on Monday.</td>
		 *          <td>Example: 42 (the 42nd week in the year)</td>
		 *      </tr>
		 *      <tr>
		 *          <td>F</td>
		 *          <td>A full textual representation of a month, such as January or March.</td>
		 *          <td>January through December</td>
		 *      </tr>
		 *      <tr>
		 *          <td>m</td>
		 *          <td>Numeric representation of a month, with leading zeros.</td>
		 *          <td>01 through 12</td>
		 *      </tr>
		 *      <tr>
		 *          <td>M</td>
		 *          <td>A short textual representation of a month, three letters.</td>
		 *          <td>Jan through Dec</td>
		 *      </tr>
		 *      <tr>
		 *          <td>n</td>
		 *          <td>Numeric representation of a month, without leading zeros.</td>
		 *          <td>1 through 12</td>
		 *      </tr>
		 *      <tr>
		 *          <td>t</td>
		 *          <td>Number of days in the given month.</td>
		 *          <td>28 through 31</td>
		 *      </tr>
		 *      <tr>
		 *          <td>L</td>
		 *          <td>Determines if it is a leap year.</td>
		 *          <td>1 if it is a leap year, 0 otherwise</td>
		 *      </tr>
		 *      <tr>
		 *          <td>o or Y</td>
		 *          <td>A full numeric representation of a year, 4 digits.</td>
		 *          <td>Examples: 1999 or 2003</td>
		 *      </tr>
		 *      <tr>
		 *          <td>y</td>
		 *          <td>A two digit representation of a year.</td>
		 *          <td>Examples: 99 or 03</td>
		 *      </tr>
		 *      <tr>
		 *          <td>a</td>
		 *          <td>Lowercase Ante meridiem and Post meridiem.</td>
		 *          <td>am or pm</td>
		 *      </tr>
		 *      <tr>
		 *          <td>A</td>
		 *          <td>Uppercase Ante meridiem and Post meridiem.</td>
		 *          <td>AM or PM</td>
		 *      </tr>
		 *      <tr>
		 *          <td>B</td>
		 *          <td>Swatch Internet time.</td>
		 *          <td>000 through 999</td>
		 *      </tr>
		 *      <tr>
		 *          <td>g</td>
		 *          <td>12-hour format of an hour without leading zeros.</td>
		 *          <td>1 through 12</td>
		 *      </tr>
		 *      <tr>
		 *          <td>G</td>
		 *          <td>24-hour format of an hour without leading zeros.</td>
		 *          <td>0 through 23</td>
		 *      </tr>
		 *      <tr>
		 *          <td>h</td>
		 *          <td>12-hour format of an hour with leading zeros.</td>
		 *          <td>01 through 12</td>
		 *      </tr>
		 *      <tr>
		 *          <td>H</td>
		 *          <td>24-hour format of an hour with leading zeros.</td>
		 *          <td>00 through 23</td>
		 *      </tr>
		 *      <tr>
		 *          <td>i</td>
		 *          <td>Minutes with leading zeros.</td>
		 *          <td>00 to 59</td>
		 *      </tr>
		 *      <tr>
		 *          <td>s</td>
		 *          <td>Seconds, with leading zeros.</td>
		 *          <td>00 through 59</td>
		 *      </tr>
		 *      <tr>
		 *          <td>I</td>
		 *          <td>Determines if the date is in daylight saving time.</td>
		 *          <td>1 if Daylight Saving Time, 0 otherwise</td>
		 *      </tr>
		 *      <tr>
		 *          <td>O</td>
		 *          <td>Difference to coordinated universal time (UTC) in hours.</td>
		 *          <td>Example: +0200</td>
		 *      </tr>
		 *      <tr>
		 *          <td>P</td>
		 *          <td>Difference to Greenwich time (GMT/UTC) in hours with colon between hours and minutes.</td>
		 *          <td>Example: +02:00</td>
		 *      </tr>
		 *      <tr>
		 *          <td>e or T</td>
		 *          <td>Timezone abbreviation.</td>
		 *          <td>Examples: EST, MDT</td>
		 *      </tr>
		 *      <tr>
		 *          <td>Z</td>
		 *          <td>Timezone offset in seconds.</td>
		 *          <td>-43200 through 50400</td>
		 *      </tr>
		 *      <tr>
		 *          <td>c</td>
		 *          <td>ISO 8601 date.</td>
		 *          <td>2004-02-12T15:19:21+00:00</td>
		 *      </tr>
		 *      <tr>
		 *          <td>r</td>
		 *          <td>RFC 2822 formatted date.</td>
		 *          <td>Example: Thu, 21 Dec 2000 16:01:07 +0200</td>
		 *      </tr>
		 *      <tr>
		 *          <td>U</td>
		 *          <td>Seconds since the Unix Epoch.</td>
		 *          <td>Example: 1171479314</td>
		 *      </tr>
		 *  </table>
		 * @param dateToFormat {@code Date} object you wish to format
		 * @param formatString Format of the outputted date {@code String}. See the format characters options above.
		 * @usageNote You can prevent a recognized character in the format string from being expanded by escaping it with a preceding {@code ^}.
		 * @example
		 *      <code>
		 *          trace(DateUtils.formatDate(new Date(), "l ^t^h^e dS ^of F Y h:i:s A"));
		 *      </code>
		 * @todo Test
		 */
		public static function formatDate(dateToFormat:Date, formatString:String):String {
			var out:String = "";
			var c:String;
			var i:int = -1;
			var l:uint = formatString.length;
			var t:Number;

			while(++i < l) {
				c = formatString.substr(i, 1);

				if(c == "^") out += formatString.substr(++i, 1);

				else {
					switch(c) {
						case "d" :
							// Day of the month, 2 digits with leading zeros
							out += NumberUtils.addLeadingZero(dateToFormat.getDate());
							break;

						case "D" :
							// A textual representation of a day, three letters
							out += getDayAbbrAsString(dateToFormat.getDay());
							break;

						case "j" :
							// Day of the month without leading zeros
							out += dateToFormat.getDate().toString();
							break;

						case "l" :
							// A full textual representation of the day of the week
							out += getDayAsString(dateToFormat.getDay());
							break;

						case "N" :
							// ISO-8601 numeric representation of the day of the week
							t = dateToFormat.getDay();
							if(t == 0) t = 7;
							out += t.toString();
							break;

						case "S" :
							// English ordinal suffix for the day of the month, 2 characters
							out += NumberUtils.getOrdinalSuffix(dateToFormat.getDate());
							break;

						case "w" :
							// Numeric representation of the day of the week
							out += dateToFormat.getDay().toString();
							break;

						case "z" :
							// The day of the year (starting from 0)
							out += NumberUtils.addLeadingZero(getDayOfTheYear(dateToFormat)).toString();
							break;

						case "W" :
							// ISO-8601 week number of year, weeks starting on Monday
							out += NumberUtils.addLeadingZero(getWeekOfTheYear(dateToFormat)).toString();
							break;

						case "F" :
							// A full textual representation of a month, such as January or March
							out += getMonthAsString(dateToFormat.getMonth());
							break;

						case "m" :
							// Numeric representation of a month, with leading zeros
							out += NumberUtils.addLeadingZero(dateToFormat.getMonth() + 1);
							break;

						case "M" :
							// A short textual representation of a month, three letters
							out += getMonthAbbrAsString(dateToFormat.getMonth());
							break;

						case "n" :
							// Numeric representation of a month, without leading zeros
							out += (dateToFormat.getMonth() + 1).toString();
							break;

						case "t" :
							// Number of days in the given month
							out += getDaysInMonth(dateToFormat.getMonth(), dateToFormat.getFullYear()).toString();
							break;

						case "L" :
							// Whether it is a leap year
							out += (isLeapYear(dateToFormat.getFullYear())) ? "1" : "0";
							break;

						case "o" :
						case "Y" :
							// A full numeric representation of a year, 4 digits
							out += dateToFormat.getFullYear().toString();
							break;

						case "y" :
							// A two digit representation of a year
							out += dateToFormat.getFullYear().toString().substr(-2);
							break;

						case "a" :
							// Lowercase Ante meridiem and Post meridiem
							out += getMeridiem(dateToFormat.getHours()).toLowerCase();
							break;

						case "A" :
							// Uppercase Ante meridiem and Post meridiem
							out += getMeridiem(dateToFormat.getHours());
							break;

						case "B" :
							// Swatch Internet time
							out += NumberUtils.format(getInternetTime(dateToFormat), 3, null, "0");
							break;

						case "g" :
							// 12-hour format of an hour without leading zeros
							t = dateToFormat.getHours();
							if(t == 0) {
								t = 12;
							} else if(t > 12) {
								t -= 12;
							}
							out += t.toString();
							break;

						case "G" :
							// 24-hour format of an hour without leading zeros
							out += dateToFormat.getHours().toString();
							break;

						case "h" :
							// 12-hour format of an hour with leading zeros
							t = dateToFormat.getHours() + 1;
							if(t == 0) {
								t = 12;
							} else if(t > 12) {
								t -= 12;
							}
							out += NumberUtils.addLeadingZero(t);
							break;

						case "H" :
							// 24-hour format of an hour with leading zeros
							out += NumberUtils.addLeadingZero(dateToFormat.getHours());
							break;

						case "i" :
							// Minutes with leading zeros
							out += NumberUtils.addLeadingZero(dateToFormat.getMinutes());
							break;

						case "s" :
							// Seconds, with leading zeros
							out += NumberUtils.addLeadingZero(dateToFormat.getSeconds());
							break;

						case "I" :
							// Whether or not the date is in daylights savings time
							out += (isDaylightSavings(dateToFormat)) ? "1" : "0";
							break;

						case "O" :
							// Difference to Greenwich time (GMT/UTC) in hours
							out += getFormattedDifferenceFromUTC(dateToFormat);
							break;

						case "P" :
							out += getFormattedDifferenceFromUTC(dateToFormat, ":");
							break;

						case "e" :
						case "T" :
							// Timezone identifier
							out += getTimezone(dateToFormat);
							break;

						case "Z" :
							// Timezone offset (GMT/UTC) in seconds.
							out += Math.round(getDifferenceFromUTCInSeconds(dateToFormat)).toString();
							break;

						case "c" :
							// ISO 8601 date
							out += dateToFormat.getFullYear() + "-" + NumberUtils.addLeadingZero(dateToFormat.getMonth() + 1) + "-" + NumberUtils.addLeadingZero(dateToFormat.getDate()) + "T" + NumberUtils.addLeadingZero(dateToFormat.getHours()) + ":" + NumberUtils.addLeadingZero(dateToFormat.getMinutes()) + ":" + NumberUtils.addLeadingZero(dateToFormat.getSeconds()) + getFormattedDifferenceFromUTC(dateToFormat, ":");
							break;

						case "r" :
							// RFC 2822 formatted date
							out += getDayAbbrAsString(dateToFormat.getDay()) + ", " + dateToFormat.getDate() + " " + getMonthAbbrAsString(dateToFormat.getMonth()) + " " + dateToFormat.getFullYear() + " " + NumberUtils.addLeadingZero(dateToFormat.getHours()) + ":" + NumberUtils.addLeadingZero(dateToFormat.getMinutes()) + ":" + NumberUtils.addLeadingZero(dateToFormat.getSeconds()) + " " + getFormattedDifferenceFromUTC(dateToFormat);
							break;

						case "U" :
							// Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)
							t = Math.round(dateToFormat.getTime() / 1000);
							out += t.toString();
							break;

						default :
							out += formatString.substr(i, 1);
					}
				}
			}

			return out;
		}



		/**
		 * Converts W3C ISO 8601 date {@code String} into a {@code Date} object.
		 * @param iso8601 Valid ISO 8601 formatted {@code String}
		 * @return {@code Date} object of the specified date and time of the ISO 8601 {@code String} in universal time
		 * @see <a href="http://www.w3.org/TR/NOTE-datetime">W3C ISO 8601 specification</a>
		 * @example
		 *      <code>
		 *          trace(DateUtils.iso8601ToDate("1994-11-05T08:15:30-05:00").toString());
		 *      </code>
		 * @todo Test
		 */
		public static function iso8601ToDate(iso8601:String):Date {
			var parts:Array = iso8601.toUpperCase().split("T");
			var date:Array = parts[0].split("-");
			var time:Array = (parts.length <= 1) ? [] : parts[1].split(":");
			var year:uint = ObjectUtils.isEmpty(date[0]) ? 0 : Number(date[0]);
			var month:uint = ObjectUtils.isEmpty(date[1]) ? 0 : Number(date[1] - 1);
			var day:uint = ObjectUtils.isEmpty(date[2]) ? 1 : Number(date[2]);
			var hour:int = ObjectUtils.isEmpty(time[0]) ? 0 : Number(time[0]);
			var minute:uint = ObjectUtils.isEmpty(time[1]) ? 0 : Number(time[1]);
			var second:uint = 0;
			var millisecond:uint = 0;

			if(time[2] != undefined) {
				var index:int = time[2].length;
				var temp:Number;

				if(time[2].indexOf("+") > -1) {
					index = time[2].indexOf("+");
				} else if(time[2].indexOf("-") > -1) {
					index = time[2].indexOf("-");
				} else if(time[2].indexOf("Z") > -1) {
					index = time[2].indexOf("Z");
				}

				if(isNaN(index)) {
					temp = Number(time[2].slice(0, index));
					second = Math.floor(temp);
					millisecond = 1000 * (temp % 1);
				}

				if(index != time[2].length) {
					var offset:String = time[2].slice(index);
					var userOffset:Number = getDifferenceFromUTCInHours(new Date(year, month, day));

					switch(offset.charAt(0)) {
						case "+" :
						case "-" :
							hour -= userOffset + Number(offset.slice(0));
							break;

						case "Z" :
							hour -= userOffset;
							break;

						default:
					}
				}
			}

			return new Date(year, month, day, hour, minute, second, millisecond);
		}



		/**
		 * Converts the month {@code Number} into the full month name.
		 * @param month Month {@code Number} ({@code 0} for January, {@code 1} for February, and so on)
		 * @return Full textual representation of a month, such as January or March
		 * @example
		 *      <code>
		 *          var myDate:Date = new Date(2000, 0, 1);
		 *          trace(getMonthAsString(myDate.getMonth())); // Traces January
		 *      </code>
		 */
		public static function getMonthAsString(month:Number):String {
			var monthNamesFull:Array = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

			return monthNamesFull[month];
		}



		/**
		 * Converts the month {@code Number} into the month abbreviation.
		 * @param month Month {@code Number} ({@code 0} for January, {@code 1} for February, and so on)
		 * @return Short textual representation of a month, three letters
		 * @example
		 *      <code>
		 *          var myDate:Date = new Date(2000, 0, 1);
		 *          trace(getMonthAbbrAsString(myDate.getMonth())); // Traces Jan
		 *      </code>
		 */
		public static function getMonthAbbrAsString(month:Number):String {
			return getMonthAsString(month).substr(0, 3);
		}



		/**
		 * Converts the day of the week {@code Number} into the full day name.
		 * @param day {@code int} representing the day of the week ({@code 0} for Sunday, {@code 1} for Monday, and so on)
		 * @return Full textual representation of the day of the week
		 * @example
		 *      <code>
		 *          var myDate:Date = new Date(2000, 0, 1);
		 *          trace(getDayAsString(myDate.getDay())); // Traces Saturday
		 *      </code>
		 */
		public static function getDayAsString(day:Number):String {
			var dayNamesFull:Array = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");

			return dayNamesFull[day];
		}



		/**
		 * Converts the day of the week {@code Number} into the day abbreviation.
		 * @param day {@code int} representing the day of the week ({@code 0} for Sunday, {@code 1} for Monday, and so on)
		 * @return Textual representation of a day, three letters
		 * @example
		 *      <code>
		 *          var myDate:Date = new Date(2000, 0, 1);
		 *          trace(getDayAbbrAsString(myDate.getDay())); // Traces Sat
		 *      </code>
		 */
		public static function getDayAbbrAsString(day:Number):String {
			return getDayAsString(day).substr(0, 3);
		}



		/**
		 * Finds the {@code Number} of days in the given month.
		 * @param year Full year
		 * @param month Month {@code Number} ({@code 0} for January, {@code 1} for February, and so on)
		 * @return {@code Number} of days in the month; {@code 28} through {@code 31}
		 * @example
		 *      <code>
		 *          var myDate:Date = new Date(2000, 0, 1);
		 *          trace(getDaysInMonth(myDate.getFullYear(), myDate.getMonth())); // Traces 31
		 *      </code>
		 */
		public static function getDaysInMonth(year:Number, month:Number):uint {
			var m:Number = month;

			return (new Date(year, ++m, 0)).getDate();
		}



		/**
		 * Determines if time is Ante meridiem or Post meridiem.
		 * @param hours Hour to find the meridiem of (an {@code int} from {@code 0} to {@code 23})
		 * @return Either {@code "AM"} or {@code "PM"}
		 * @example
		 *      <code>
		 *          trace(getMeridiem(17)); // Traces PM
		 *      </code>
		 */
		public static function getMeridiem(hours:Number):String {
			return (hours < 12) ? "AM" : "PM";
		}



		/**
		 * Determines the difference between two {@code Date}s.
		 * @param startDate Starting {@code Date}
		 * @param endDate Ending {@code Date}
		 * @return Difference in milliseconds between the two {@code Date}s
		 * @example
		 *      <code>
		 *          trace(ConversionUtil.millisecondsToDays(getTimeBetween(new Date(2007, 0, 1), new Date(2007, 0, 11)))); // Traces 10
		 *      </code>
		 */
		public static function getTimeBetween(startDate:Date, endDate:Date):Number {
			return endDate.getTime() - startDate.getTime();
		}



		/**
		 * Determines the time remaining until a certain {@code Date}.
		 * @param startDate Starting {@code Date}
		 * @param endDate Ending {@code Date}
		 * @return {@code Object} with the properties {@code days}, {@code hours}, {@code minutes}, {@code seconds} and {@code milliseconds} defined as {@code Number}s
		 * @example
		 *      <code>
		 *          var countdown:Object = getCountdownUntil(new Date(2006, 11, 31, 21, 36), new Date(2007, 0, 1));
		 *          trace("There are " + countdown.hours + " hours and " + countdown.minutes + " minutes until the new year!");
		 *      </code>
		 */
		public static function getCountdownUntil(startDate:Date, endDate:Date):Object {
			var daysUntil:Number = ConversionUtils.millisecondsToDays(getTimeBetween(startDate, endDate));
			var hoursUntil:Number = ConversionUtils.daysToHours(daysUntil % 1);
			var minsUntil:Number = ConversionUtils.hoursToMinutes(hoursUntil % 1);
			var secsUntil:Number = ConversionUtils.minutesToSeconds(minsUntil % 1);
			var milliUntil:Number = ConversionUtils.secondsToMilliseconds(secsUntil % 1);

			return {
				days:int(daysUntil),
				hours:int(hoursUntil),
				minutes:int(minsUntil),
				seconds:int(secsUntil),
				milliseconds: int(milliUntil)
			};
		}



		/**
		 * Determines the difference to coordinated universal time (UTC) in seconds.
		 * @param date {@code Date} object to find the time zone offset of
		 * @return Difference in seconds from UTC
		 */
		public static function getDifferenceFromUTCInSeconds(date:Date):int {
			return ConversionUtils.minutesToSeconds(date.getTimezoneOffset());
		}



		/**
		 * Determines the difference to coordinated universal time (UTC) in hours.
		 * @param date {@code Date} object to find the time zone offset of
		 * @return Difference in hours from UTC
		 */
		public static function getDifferenceFromUTCInHours(date:Date):int {
			return ConversionUtils.minutesToHours(date.getTimezoneOffset());
		}



		/**
		 * Formats the difference to coordinated undefined time (UTC).
		 * @param date {@code Date} object to find the time zone offset of
		 * @param separator Character(s) that separates the hours from minutes
		 * @return Formatted time difference from UTC
		 */
		public static function getFormattedDifferenceFromUTC(date:Date, separator:String = ""):String {
			var pre:String = (-date.getTimezoneOffset() < 0) ? "-" : "+";

			return pre + NumberUtils.addLeadingZero(Math.floor(getDifferenceFromUTCInHours(date))) + separator + NumberUtils.addLeadingZero(date.getTimezoneOffset() % 60);
		}



		/**
		 * Determines the time zone of the user from a {@code Date} object.
		 * @param date {@code Date} object to find the time zone of
		 * @return Time zone abbreviation
		 * @example
		 *      <code>
		 *          trace(getTimezone(new Date()));
		 *      </code>
		 */
		public static function getTimezone(date:Date):String {
			var timeZones:Array = new Array("IDLW", "NT", "HST", "AKST", "PST", "MST", "CST", "EST", "AST", "ADT", "AT", "WAT", "GMT", "CET", "EET", "MSK", "ZP4", "ZP5", "ZP6", "WAST", "WST", "JST", "AEST", "AEDT", "NZST");
			var hour:uint = Math.round(12 + -(date.getTimezoneOffset() / 60));

			if(isDaylightSavings(date)) hour--;

			return timeZones[hour];
		}



		/**
		 * Determines if year is a leap year or a common year.
		 * @param year Full year
		 * @return {@code true} if year is a leap year
		 * @example
		 *      <code>
		 *          var myDate:Date = new Date(2000, 0, 1);
		 *          trace(isLeapYear(myDate.getFullYear())); // traces true
		 *      </code>
		 */
		public static function isLeapYear(year:Number):Boolean {
			return getDaysInMonth(year, 1) == 29;
		}



		/**
		 * Determines if or not the {@code Date} is in daylight saving time.
		 * @param date {@code Date} to find if it is during daylight savings time
		 * @return {@code true} if daylight savings time
		 */
		public static function isDaylightSavings(date:Date):Boolean {
			var out:Boolean;
			var months:uint = 12;
			var offset:uint = date.getTimezoneOffset();
			var offsetCheck:Number;

			while(months--) {
				offsetCheck = (new Date(date.getFullYear(), months, 1)).getTimezoneOffset();
				if(offsetCheck != offset) out = (offsetCheck > offset);
			}

			return out;
		}



		/**
		 * Converts current time into Swatch internet time or beats.
		 * @param date {@code Date} object to convert
		 * @return Time in beats (0 to 999)
		 */
		public static function getInternetTime(date:Date):Number {
			var beats:uint = ((date.getUTCHours() + 1 + ConversionUtils.minutesToHours(date.getUTCMinutes()) + ConversionUtils.secondsToHours(date.getUTCSeconds())) / 0.024);

			return (beats > 1000) ? beats - 1000 : beats;
		}



		/**
		 * Gets the current day out of the total days in the year (starting from {@code 0}).
		 * @param date {@code Date} object to find the current day of the year from
		 * @return Current day of the year ({@code 0}-{@code 364} or {@code 0}-{@code 365} on a leap year).
		 */
		public static function getDayOfTheYear(date:Date):uint {
			var firstDay:Date = new Date(date.getFullYear(), 0, 1);

			return (date.getTime() - firstDay.getTime()) / 86400000;
		}



		/**
		 * Determines the week number of year, weeks start on Mondays.
		 * @param date Date object to find the current week number of.
		 * @return Week of the year the date falls in.
		 */
		public static function getWeekOfTheYear(date:Date):uint {
			var firstDay:Date = new Date(date.getFullYear(), 0, 1);
			var dayOffset:uint = 9 - firstDay.getDay();
			var firstMonday:Date = new Date(date.getFullYear(), 0, (dayOffset > 7) ? dayOffset - 7 : dayOffset);
			var currentDay:Date = new Date(date.getFullYear(), date.getMonth(), date.getDate());
			var weekNumber:uint = (ConversionUtils.millisecondsToDays(currentDay.getTime() - firstMonday.getTime()) / 7) + 1;

			return (weekNumber == 0) ? getWeekOfTheYear(new Date(date.getFullYear() - 1, 11, 31)) : weekNumber;
		}



		/**
		 * Determines if two {@code Date}s are the same time.
		 * @param first {@code Date} to compare to {@code second}
		 * @param second {@code Date} to compare to {@code first}
		 * @return {@code true} if {@code Date}s are the same
		 */
		public static function equals(first:Date, second:Date):Boolean {
			return first.valueOf() == second.valueOf();
		}



		/**
		 * Utility function for generating time code given a number seconds.
		 * @param sec Seconds
		 * @return Timecode
		 */
		public static function timeCode(sec:Number):String {
			var h:Number = Math.floor(sec / 3600);
			var m:Number = Math.floor((sec % 3600) / 60);
			var s:Number = Math.floor((sec % 3600) % 60);

			//noinspection NestedConditionalExpressionJS
			return (h == 0 ? "" : (h < 10 ? "0" + h.toString() + ":" : h.toString() + ":")) + (m < 10 ? "0" + m.toString() : m.toString()) + ":" + (s < 10 ? "0" + s.toString() : s.toString());
		}
	}
}
