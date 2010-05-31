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

package com.falanxia.utilitaris.locale {
	import com.falanxia.utilitaris.utils.*;

	import flash.utils.*;



	/**
	 * Language dictionary.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class LanguageDictionary {


		private var _lang:String;

		private var dictionary:Dictionary;



		/**
		 * Constructor.
		 * @param lang Language ({@code "en"} by default)
		 */
		public function LanguageDictionary(lang:String = "en") {
			_lang = lang;
			dictionary = new Dictionary();
		}



		/**
		 * Parse locale {@code XML}.
		 * @param list Locale {@code XML}
		 */
		public function parseXML(list:XMLList):void {
			for each(var x:XML in list) {
				dictionary[String(x.@id)] = StringUtils.trim(x.toString());
			}
		}



		/**
		 * Parse locale {@code Object}.
		 * @param list Locale {@code Object}
		 */
		public function parseObject(list:Object):void {
			for(var id:String in list) {
				dictionary[id] = StringUtils.trim(String(list[id]));
			}
		}



		/**
		 * Get text by its ID.
		 * @param id Text ID
		 * @return Text if found, null if not
		 */
		public function getText(id:String):String {
			return dictionary[id];
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Get current language.
		 * @return Current language (like {@code "en"})
		 */
		public function get lang():String {
			return _lang;
		}
	}
}
