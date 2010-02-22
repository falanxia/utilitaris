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
	 * Percent data type.
	 * Creates a standardized way of describing and storing percentages. You can store and receive percentages in two
	 * different formats; regular percentage or as an decimal percentage. If percent is 37.5% a regular percentage would
	 * be expressed as <code>37.5</code> while the decimal percentage will be expressed <code>0.375</code>.
	 *
	 * @author Aaron Clinger
	 * @author Mike Creighton
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public final class Percent {


		protected var percent:Number;



		/**
		 * Creates a new Percent.
		 * @param percentage Percent formated at a percentage or an decimal percentage.
		 * @param isDecimalPercentage Indicates if the parameter <code>percentage</code> is a decimal percentage <code>true</code>, or regular percentage <code>false</code>.
		 */
		public final function Percent(percentage:Number = 0, isDecimalPercentage:Boolean = true) {
			if(isDecimalPercentage) this.decimalPercentage = percentage;
			else this.percentage = percentage;
		}



		/**
		 * Determines if the percent specified in the <code>percent</code> parameter is equal to this percent object.
		 * @param percent A Percent object.
		 * @return Returns <code>true</code> if percents are identical; otherwise <code>false</code>.
		 */
		public final function equals(percent:Percent):Boolean {
			return this.decimalPercentage == percent.decimalPercentage;
		}



		/**
		 * Get clone.
		 * @return New percent object with the same value as this percent.
		 */
		public final function clone():Percent {
			return new Percent(this.decimalPercentage);
		}



		/**
		 * Get value.
		 * @return Value
		 */
		public final function valueOf():Number {
			return this.decimalPercentage;
		}



		/**
		 * Get string.
		 * @return String
		 */
		public final function toString():String {
			return this.decimalPercentage.toString();
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Get percent expressed as a regular percentage. 37.5% would be expressed as <code>37.5</code>.
		 * @return Percentage
		 */
		public final function get percentage():Number {
			return 100 * this.percent;
		}



		/**
		 * Set percent expressed as a regular percentage. 37.5% would be expressed as <code>37.5</code>.
		 * @param percent Percentage
		 */
		public final function set percentage(percent:Number):void {
			this.percent = percent * 0.01;
		}



		/**
		 * Get percent expressed as a decimal percentage. 37.5% would be expressed as <code>0.375</code>.
		 * @return Percentage
		 */
		public final function get decimalPercentage():Number {
			return this.percent;
		}



		/**
		 * Set percent expressed as a decimal percentage. 37.5% would be expressed as <code>0.375</code>.
		 * @param percent
		 */
		public final function set decimalPercentage(percent:Number):void {
			this.percent = percent;
		}
	}
}
