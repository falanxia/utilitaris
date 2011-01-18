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

package com.falanxia.utilitaris.locale {
	import com.falanxia.utilitaris.typogryphix.Typogryphix;



	/**
	 * Locale manager.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class Locale {


		private static var instance:Locale;

		private var dictionaries:Array = [];
		private var currentDictionary:LanguageDictionary;

		private var _currentLanguage:String = "";



		/**
		 * Constructor.
		 */
		public function Locale(s:Senf) {
			if(s == null) throw new Error("Locale is singleton, use getInstance() method");
		}



		/**
		 * Singleton acces method
		 * @return Instance of the Locale singleton.
		 */
		public static function getInstance():Locale {
			if(instance == null) instance = new Locale(new Senf());

			return instance;
		}



		/**
		 * Parse locale XML.
		 * @param locale Locales node in the XML
		 */
		public function parseXML(locale:XMLList):void {
			for each(var lang:XML in locale.locale) {
				var dictionary:LanguageDictionary = new LanguageDictionary(lang.@lang);

				dictionary.parseXML(lang.text);

				dictionaries.push(dictionary);

				if(_currentLanguage == "") this.currentLanguage = lang.@lang;
			}
		}



		/**
		 * Parse locale Object.
		 * @param locale Locales node in the Object
		 */
		public function parseObject(locale:Object, doRewriteLangDict:Boolean = true):void {
			for(var lang:String in locale) {
				var dictionary:LanguageDictionary;
				var isDictFound:Boolean;

				if(doRewriteLangDict) {
					dictionary = new LanguageDictionary(lang);
				}

				else {
					var l:uint = dictionaries.length;

					for(var i:int = 0; i < l; i++) {
						if(LanguageDictionary(dictionaries[i]).lang == lang) {
							dictionary = LanguageDictionary(dictionaries[i]);
							isDictFound = true;

							break;
						}
					}
				}

				dictionary.parseObject(locale[lang]);

				if(doRewriteLangDict && !isDictFound) dictionaries.push(dictionary);

				if(currentLanguage == "") this.currentLanguage = lang;
			}
		}



		/**
		 * Get text by its ID.
		 * @param id Text ID
		 * @return Text if found, null if not
		 */
		public function getText(id:String):String {
			var out:String;

			if(currentDictionary != null) {
				out = currentDictionary.getText(id);
			}

			// locale string not found
			if(out == null) out = "[" + id + "]";

			return Typogryphix.please(out);
		}



		/**
		 * Set current language.
		 * @param value Language (like "en")
		 * @throws Error if language not found in currently active dictionaries
		 */
		public function set currentLanguage(value:String):void {
			var f:LanguageDictionary;

			for each(var dictionary:LanguageDictionary in dictionaries) {
				if(dictionary.lang == value) f = dictionary;
			}

			if(f == null) {
				throw new Error("Language " + value + " not found in currently active dictionaries");
			}

			_currentLanguage = value;
			currentDictionary = f;
		}



		/**
		 * Get current language.
		 * @return Current language (like "en")
		 */
		public function get currentLanguage():String {
			return _currentLanguage;
		}



		/**
		 * Get languages list.
		 * @return Languages list
		 */
		public function get languageList():Array {
			var out:Array = [];

			for each(var dictionary:LanguageDictionary in dictionaries) {
				out.push(dictionary.lang);
			}

			return out;
		}
	}
}



class Senf {
}
