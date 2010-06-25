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
	import flash.events.*;



	/**
	 * Locale manager.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class Locale extends EventDispatcher {


		private static var dictionaries:Array = [];
		private static var currentLanguage:String = "";
		private static var currentDictionary:LanguageDictionary;



		/**
		 * Parse locale {@code XML}.
		 * @param locale Locales node in the {@code XML}
		 */
		public static function parseXML(locale:XMLList):void {
			for each(var lang:XML in locale.locale) {
				var dictionary:LanguageDictionary = new LanguageDictionary(lang.@lang);

				dictionary.parseXML(lang.text);

				dictionaries.push(dictionary);

				if(currentLanguage == "") language = lang.@lang;
			}
		}



		/**
		 * Parse locale {@code Object}.
		 * @param locale Locales node in the {@code Object}
		 */
		public static function parseObject(locale:Object):void {
			for(var lang:String in locale) {
				var dictionary:LanguageDictionary = new LanguageDictionary(lang);

				dictionary.parseObject(locale[lang]);

				dictionaries.push(dictionary);

				if(currentLanguage == "") language = lang;
			}
		}



		/**
		 * Get text by its ID.
		 * @param id Text ID
		 * @return Text if found, null if not
		 */
		public static function getText(id:String):String {
			var out:String;

			if(currentDictionary != null) out = currentDictionary.getText(id);

			// locale string not found
			if(out == null) out = "[" + id + "]";

			return out;
		}



		/**
		 * Set current language.
		 * @param value Language (like "en")
		 * @throws Error if language not found in currently active dictionaries
		 */
		public static function set language(value:String):void {
			var f:LanguageDictionary;

			for each(var dictionary:LanguageDictionary in dictionaries) {
				if(dictionary.lang == value) f = dictionary;
			}

			if(f == null) {
				throw new Error("Language " + value + " not found in currently active dictionaries");
			}

			currentLanguage = value;
			currentDictionary = f;
		}



		/**
		 * Get current language.
		 * @return Current language (like "en")
		 */
		public static function get language():String {
			return currentLanguage;
		}



		/**
		 * Get languages list.
		 * @return Languages list
		 */
		public static function get languageList():Array {
			var out:Array = [];

			for each(var dictionary:LanguageDictionary in dictionaries) {
				out.push(dictionary.lang);
			}

			return out;
		}
	}
}
