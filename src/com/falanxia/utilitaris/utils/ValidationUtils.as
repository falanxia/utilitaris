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
	 * Validation utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class ValidationUtils {


		/** Invalid card */
		public static const CARD_INVALID:String = 'invalid';

		/** Visa card */
		public static const CARD_VISA:String = 'visa';

		/** MasterCard card */
		public static const CARD_MASTERCARD:String = 'mastercard';

		/** Discover card */
		public static const CARD_DISCOVER:String = 'discover';

		/** Amex card */
		public static const CARD_AMEX:String = 'amex';

		/** Diners card */
		public static const CARD_DINERS:String = 'diners';

		/** Other card */
		public static const CARD_OTHER:String = 'other';



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws Error since the class could not be instantiated
		 */
		public function ValidationUtils() {
			throw new Error('The class cannot be instantiated');
		}



		/**
		 * Determines if {@code String} is a valid email address.
		 * @param email {@code String} to verify as email
		 * @return {@code true} if {@code String} is a valid email
		 * @see <a href="http://www.regular-expressions.info/email.html">Read more about the regular expression used by this method.</a>
		 */
		public static function isEmail(email:String):Boolean {
			var pattern:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
			return email.match(pattern) != null;
		}



		/**
		 * Determines if {@code String} is a valid USA state abbreviation.
		 * @param state {@code String} to verify as two letter state abbreviation (includes DC)
		 * @return {@code true} if {@code String} is a state abbreviation
		 */
		public static function isUsaStateAbbreviation(state:String):Boolean {
			var states:Array = new Array('ak', 'al', 'ar', 'az', 'ca', 'co', 'ct', 'dc', 'de', 'fl', 'ga', 'hi', 'ia', 'id', 'il', 'in', 'ks', 'ky', 'la', 'ma', 'md', 'me', 'mi', 'mn', 'mo', 'ms', 'mt', 'nb', 'nc', 'nd', 'nh', 'nj', 'nm', 'nv', 'ny', 'oh', 'ok', 'or', 'pa', 'ri', 'sc', 'sd', 'tn', 'tx', 'ut', 'va', 'vt', 'wa', 'wi', 'wv', 'wy');
			return ArrayUtils.contains(states, state.toLowerCase()) == 1;
		}



		/**
		 * Determines if credit number card is valid using the Luhn formula.
		 * @param cardNumber Credit card number
		 * @return {@code true} if {@code String} is a valid credit card number
		 */
		public static function isCreditCard(cardNumber:String):Boolean {
			var out:Boolean;

			if(cardNumber.length < 7 || cardNumber.length > 19 || Number(cardNumber) < 1000000) {
				out = false
			}
			else {
				var pre:Number;
				var sum:Number = 0;
				var alt:Boolean = true;

				var i:Number = cardNumber.length;
				while(--i > -1) {
					if(alt) {
						sum += Number(cardNumber.substr(i, 1));
					}
					else {
						pre = Number(cardNumber.substr(i, 1)) * 2;
						sum += (pre > 8) ? pre -= 9 : pre;
					}

					alt = !alt;
				}

				out = (sum % 10 == 0);
			}

			return out;
		}



		/**
		 * Determines credit card provider by card number.
		 * @param cardNumber Credit card number
		 * @return Name of the provider; values can be {@code "visa"}, {@code "mastercard"}, {@code "discover"}, {@code "amex"}, {@code "diners"}, {@code "other"} or {@code "invalid"}.
		 */
		public static function getCreditCardProvider(cardNumber:String):String {
			var out:String = CARD_INVALID;

			if(isCreditCard(cardNumber)) {
				if(cardNumber.length == 13 || cardNumber.length == 16 && cardNumber.indexOf('4') == 0) {
					out = CARD_VISA;
				}
				else {
					if(cardNumber.indexOf('51') == 0 || cardNumber.indexOf('52') == 0 || cardNumber.indexOf('53') == 0 || cardNumber.indexOf('54') == 0 || cardNumber.indexOf('55') == 0 && cardNumber.length == 16) {
						out = CARD_MASTERCARD;
					} else if(cardNumber.length == 16 && cardNumber.indexOf('6011') == 0) {
						out = CARD_DISCOVER;
					} else if(cardNumber.indexOf('34') == 0 || cardNumber.indexOf('37') == 0 && cardNumber.length == 15) {
						out = CARD_AMEX;
					} else if(cardNumber.indexOf('300') == 0 || cardNumber.indexOf('301') == 0 || cardNumber.indexOf('302') == 0 || cardNumber.indexOf('303') == 0 || cardNumber.indexOf('304') == 0 || cardNumber.indexOf('305') == 0 || cardNumber.indexOf('36') == 0 || cardNumber.indexOf('38') == 0 && cardNumber.length == 14) {
						out = CARD_DINERS;
					}
					else out = CARD_OTHER;
				}
			}

			return out;
		}
	}
}
