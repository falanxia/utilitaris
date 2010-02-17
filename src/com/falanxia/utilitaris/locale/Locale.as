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
	import flash.events.EventDispatcher;



	/**
	 * Locale manager.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class Locale extends EventDispatcher {


		private static var _dictionaries:Array = [];
		private static var _currentLanguage:String = '';
		private static var _currentDictionary:LanguageDictionary;



		/**
		 * Parse locale XML.
		 * @param locales Locales node in the XML
		 */
		public static function parseXML(locales:XMLList):void {
			for each(var lang:XML in locales.locale) {
				var dictionary:LanguageDictionary = new LanguageDictionary(lang.@lang);

				dictionary.parseXML(lang.text);

				_dictionaries.push(dictionary);

				if(_currentLanguage == '') language = lang.@lang;
			}
		}



		/**
		 * Get text by its ID.
		 * @param id Text ID
		 * @return Text if found, null if not
		 */
		public static function getText(id:String):String {
			var out:String;

			if(_currentDictionary != null) out = _currentDictionary.getText(id);

			// locale string not found
			if(out == null) out = '[' + id + ']';

			return out;
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Set current language.
		 * @param value Language (like 'en')
		 * @throws Error if language not found in currently active dictionaries
		 */
		public static function set language(value:String):void {
			var f:LanguageDictionary;

			for each(var dictionary:LanguageDictionary in _dictionaries) {
				if(dictionary.lang == value) f = dictionary;
			}

			if(f == null) {
				throw new Error('Language ' + value + ' not found in currently active dictionaries');
			}

			_currentLanguage = value;
			_currentDictionary = f;
		}



		/**
		 * Get current language.
		 * @return Current language (like 'en')
		 */
		public static function get language():String {
			return _currentLanguage;
		}
	}
}