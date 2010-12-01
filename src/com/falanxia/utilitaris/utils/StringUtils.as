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
	import com.falanxia.utilitaris.helpers.printf;



	/**
	 * String utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Jonnie Hallman / Destroytoday (<a href="http://destroytoday.com">destroytoday.com</a>)
	 * @author Grant Skinner (<a href="http://gskinner.com">gskinner.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class StringUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function StringUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Slash unsafe characters from the String.
		 * @param value Unsafe String
		 * @return Safe String
		 */
		protected static function slashUnsafeChars(value:String):String {
			var unsafeChar:String;
			var m:uint = "\\-^[]".length;
			var v:String = value;

			for(var i:uint = 0; i < m; ++i) {
				unsafeChar = "\\-^[]".substr(i, 1);

				if(v.indexOf(unsafeChar) != -1) {
					v = v.replace(unsafeChar, "\\" + unsafeChar);
				}
			}

			return v;
		}



		/**
		 * Returns the String with slashes prepended to all characters specified in the chars parameter.
		 * @param value String to return slashed
		 * @param ch String of chars to slash
		 * @return String with slashes prepended to all characters
		 */
		public static function addSlashes(value:String, ch:String = "\""):String {
			var out:String;
			var c:String = ch;

			// return the unaltered string if str or chars are null or empty
			if(!value || !c) {
				out = value;
			}
			else {
				// slash unsafe characters
				c = slashUnsafeChars(c);

				// build the regular expression that handles the slashing
				var regex:RegExp = new RegExp("([" + c + "])", "g");

				// add the slashes to the specified characters
				out = value.replace(regex, "\\$1");
			}

			return out;
		}



		/**
		 * Returns the String with slashes removed from all characters specified in the chars parameter.
		 * @param value String to return stripped of slashes
		 * @param ch String of chars to remove slashes from
		 * @return String with slashes removed from all characters
		 */
		public static function stripSlashes(value:String, ch:String = "\""):String {
			var out:String;
			var c:String = ch;

			// return the unaltered string if str or chars are null or empty
			if(!value || !c) {
				out = value;
			}
			else {
				// slash unsafe characters
				c = slashUnsafeChars(c);

				// build the regular expression that removes the slashes
				var regex:RegExp = new RegExp("\\\\([" + c + "])", "g");

				// strip the slashes from the specified characters
				out = value.replace(regex, "$1");
			}

			return out;
		}



		/**
		 * Returns everything after the first occurrence of the provided character in the String.
		 * @param value Input String
		 * @param ch Character or sub-string
		 * @returns Output String
		 */
		public static function afterFirst(value:String, ch:String):String {
			var out:String = "";

			if(value != null) {
				var idx:int = value.indexOf(ch);

				if(idx != -1) {
					idx += ch.length;
					out = value.substr(idx);
				}
			}

			return out;
		}



		/**
		 * Returns everything after the last occurence of the provided character in value.
		 * @param value Input String
		 * @param ch Character or sub-string
		 * @return Output String
		 */
		public static function afterLast(value:String, ch:String):String {
			var out:String = "";

			if(value != null) {
				var idx:int = value.lastIndexOf(ch);

				if(idx != -1) {
					idx += ch.length;
					out = value.substr(idx);
				}
			}

			return out;
		}



		/**
		 * Determines whether the specified String begins with the specified prefix.
		 * @param value Input String that the prefix will be checked against
		 * @param begin Prefix that will be tested against the String
		 * @returns Boolean true if the input String begins with the specified prefix
		 */
		public static function beginsWith(value:String, begin:String):Boolean {
			var out:Boolean;

			if(value != null) {
				out = value.indexOf(begin) == 0;
			}

			return out;
		}



		/**
		 * Returns everything before the first occurrence of the provided character in the String.
		 * @param value Input String
		 * @param ch Character or sub-string
		 * @returns Everything before the first occurence of the provided character in the String
		 */
		public static function beforeFirst(value:String, ch:String):String {
			var out:String = "";

			if(value != null) {
				var idx:int = value.indexOf(ch);

				if(idx != -1) {
					out = value.substr(0, idx);
				}
			}

			return out;
		}



		/**
		 * Returns everything before the last occurrence of the provided character in the String.
		 * @param value Input String
		 * @param ch Character or sub-string
		 * @returns Everything before the last occurrence of the provided character in the String
		 */
		public static function beforeLast(value:String, ch:String):String {
			var out:String = "";

			if(value != null) {
				var idx:int = value.lastIndexOf(ch);

				if(idx != -1) {
					out = value.substr(0, idx);
				}
			}

			return out;
		}



		/**
		 * Returns everything after the first occurance of begin and before the first occurrence of end in String.
		 * @param value Input String
		 * @param start Character or sub-string to use as the start index
		 * @param end Character or sub-string to use as the end index
		 * @returns Everything after the first occurance of begin and before the first occurrence of end in String.
		 */
		public static function between(value:String, start:String, end:String):String {
			var out:String = "";

			if(value != null) {
				var startIdx:int = value.indexOf(start);

				if(startIdx != -1) {
					startIdx += start.length; // RM: should we support multiple chars? (or ++startIdx);

					var endIdx:int = value.indexOf(end, startIdx);

					if(endIdx != -1) {
						out = value.substr(startIdx, endIdx - startIdx);
					}
				}
			}

			return out;
		}



		/**
		 * Description, Utility method that intelligently breaks up your String, allowing you to create blocks
		 * of readable text. This method returns you the closest possible match to the delimiter paramater,
		 * while keeping the text length within the length paramter. If a match can't be found in your specified
		 * length an '...' is added to that block, and the blocking continues untill all the text is broken
		 * apart.
		 * @param value Input String
		 * @param length Maximum length of each block of text
		 * @param delimiter delimter to end text blocks on, default = "."
		 * @returns Array
		 */
		public static function block(value:String, length:uint, delimiter:String = "."):Array {
			var out:Array = [
			];

			if(!(value == null || !contains(value, delimiter))) {
				var chrIndex:uint = 0;
				var strLen:uint = value.length;
				var replPatt:RegExp = new RegExp("[^" + escapePattern2(delimiter) + "]+$");

				while(chrIndex < strLen) {
					var subString:String = value.substr(chrIndex, length);

					if(!contains(subString, delimiter)) {
						out.push(truncate(subString, subString.length));
						chrIndex += subString.length;
					}

					subString = subString.replace(replPatt, "");
					out.push(subString);
					chrIndex += subString.length;
				}
			}

			return out;
		}



		/**
		 * Capitallizes the first word in a String or all words.
		 * @param value Input String
		 * @returns Capitallized first word in a String or all words
		 */
		public static function capitalize(value:String, ...args):String {
			var out:String = trimLeft(value);

			if(args[0] === true) {
				out = out.replace(/^.|\b./g, upperCase2);
			}
			else {
				out = out.replace(/(^\w)/, upperCase2);
			}

			return out;
		}



		/**
		 * Determines whether the specified String contains any instances of ch.
		 * @param value Input String
		 * @param ch Character or sub-string we are looking for
		 * @returns true if the specified String contains any instances of ch
		 */
		public static function contains(value:String, ch:String):Boolean {
			var out:Boolean;

			if(value != null) {
				out = value.indexOf(ch) != -1;
			}

			return out;
		}



		/**
		 * Determines the number of times a character or sub-string appears within the String.
		 * @param value Input String
		 * @param ch Character or sub-string to count
		 * @param isCaseSensitive (optional, default is true) A boolean flag to indicate if the search is case sensitive
		 * @returns Number of times a character or sub-string appears within the String.
		 */
		public static function countOf(value:String, ch:String, isCaseSensitive:Boolean = true):uint {
			var out:uint = 0;

			if(value != null) {
				var c:String = escapePattern2(ch);
				var f:String = (isCaseSensitive) ? "g" : "ig";

				out = value.match(new RegExp(c, f)).length;
			}

			return out;
		}



		/**
		 * Levenshtein distance (editDistance) is a measure of the similarity between two Strings, the distance
		 * is the number of deletions, insertions, or substitutions required to transform value into tgt.
		 * @param value Input String
		 * @param tgt Target String
		 * @returns uint Levenshtein distance (editDistance) is a measure of the similarity
		 */
		public static function editDistance(value:String, tgt:String):uint {
			var out:uint;
			var i:uint;
			var v:String = value;
			var t:String = tgt;

			if(v == null) v = "";
			if(t == null) t = "";

			if(v == t) {
				out = 0;
			}
			else {
				var d:Array = [
				];
				var cost:uint;
				var n:uint = v.length;
				var m:uint = t.length;
				var j:uint;

				if(n == 0) {
					out = m;
				}
				else {
					if(m == 0) {
						out = n;
					}
					else {
						for(i = 0; i <= n; i++) {
							d[i] = [
							];
						}
						for(i = 0; i <= n; i++) d[i][0] = i;
						for(j = 0; j <= m; j++) d[0][j] = j;

						for(i = 1; i <= n; i++) {
							var s_i:String = v.charAt(i - 1);

							for(j = 1; j <= m; j++) {
								var t_j:String = t.charAt(j - 1);

								if(s_i == t_j) {
									cost = 0;
								}
								else {
									cost = 1;
								}

								d[i][j] = minimum2(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost);
							}
						}

						out = d[n][m];
					}
				}
			}

			return out;
		}



		/**
		 * Determines whether the specified String ends with the specified suffix.
		 * @param value String that the suffic will be checked against
		 * @param end Suffix that will be tested against the String
		 * @returns true if the specified String ends with the specified suffix
		 */
		public static function endsWith(value:String, end:String):Boolean {
			return value.lastIndexOf(end) == value.length - end.length;
		}



		/**
		 * Determines whether the specified String contains text.
		 * @param value Input String
		 * @returns true if the specified String contains text
		 */
		public static function hasText(value:String):Boolean {
			var str:String = removeExtraWhitespace(value);
			return !!str.length;
		}



		/**
		 * Determines whether the specified String contains any characters.
		 * @param value Input String
		 * @returns true if the specified String contains any characters
		 */
		public static function isEmpty(value:String):Boolean {
			var out:Boolean = true;

			if(value != null) {
				out = !value.length;
			}

			return out;
		}



		/**
		 * Determines whether the specified String is numeric.
		 * @param value Input String
		 * @returns true if the specified String is numeric
		 */
		public static function isNumeric(value:String):Boolean {
			var out:Boolean;

			if(value != null) {
				var regx:RegExp = /^[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?$/;
				out = regx.test(value);
			}

			return out;
		}



		/**
		 * Pads value with specified padChar character to a specified length from the left.
		 * @param value Input String
		 * @param padChar Character for pad
		 * @param length Length to pad to
		 * @returns Padded String
		 */
		public static function padLeft(value:String, padChar:String, length:uint):String {
			var s:String = value;

			while(s.length < length) {
				s = padChar + s;
			}

			return s;
		}



		/**
		 * Pads value with specified padChar character to a specified length from the right.
		 * @param value Input String
		 * @param padChar Character for pad
		 * @param length Length to pad to
		 * @returns Padded String
		 */
		public static function padRight(value:String, padChar:String, length:uint):String {
			var s:String = value;

			while(s.length < length) {
				s += padChar;
			}

			return s;
		}



		/**
		 * Properly cases the String in "sentence format".
		 * @param value Input String
		 * @returns Cased String
		 */
		public static function properCase(value:String):String {
			var out:String = "";

			if(value != null) {
				var str:String = value.toLowerCase().replace(/\b([^.?;!]+)/, capitalize);

				out = str.replace(/\b[i]\b/, "I");
			}

			return out;
		}



		/**
		 * Escapes all of the characters in a string to create a friendly "quotable" String.
		 * @param value String that will be checked for instances of remove String
		 * @returns Escaped String
		 */
		public static function quote(value:String):String {
			var regx:RegExp = /[\\"\r\n]/g;

			return "\"" + value.replace(regx, quote2) + "\"";
		}



		/**
		 * Removes all instances of the remove String in the input String.
		 * @param value String that will be checked for instances of remove String
		 * @param remove String that will be removed from the input String
		 * @param isCaseSensitive An optional Boolean indicating if the replace is case sensitive, default is true
		 * @returns Output String
		 */
		public static function remove(value:String, remove:String, isCaseSensitive:Boolean = true):String {
			var out:String = "";

			if(value != null) {
				var rem:String = escapePattern2(remove);
				var flags:String = (isCaseSensitive) ? "g" : "ig";

				out = value.replace(new RegExp(rem, flags), "");
			}

			return out;
		}



		/**
		 * Removes extraneous whitespace (extra spaces, tabs, line breaks, etc) from the specified String.
		 * @param value String whose extraneous whitespace will be removed
		 * @returns Output String
		 */
		public static function removeExtraWhitespace(value:String):String {
			var out:String = "";

			if(value != null) {
				var str:String = trim(value);

				out = str.replace(/\s+/g, " ");
			}

			return out;
		}



		/**
		 * Returns the specified String in reverse character order.
		 * @param value String that will be reversed
		 * @returns Output String
		 */
		public static function reverse(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.split("").reverse().join("");
			}

			return out;
		}



		/**
		 * Returns the specified String in reverse word order.
		 * @param value String that will be reversed
		 * @returns Output String
		 */
		public static function reverseWords(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.split(/\s+/).reverse().join("");
			}

			return out;
		}



		/**
		 * Determines the percentage of similiarity, based on editDistance.
		 * @param value Input String
		 * @param tgt Target String
		 * @returns Percentage of similiarity, based on editDistance
		 */
		public static function similarity(value:String, tgt:String):Number {
			var out:Number = 100;
			var ed:uint = editDistance(value, tgt);
			var maxLen:uint = Math.max(value.length, tgt.length);

			if(maxLen != 0) {
				out = (1 - ed / maxLen) * 100;
			}

			return out;
		}



		/**
		 * Remove's all < and > based tags from a String.
		 * @param value Input String
		 * @returns Output String
		 */
		public static function stripTags(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.replace(/<\/?[^>]+>/igm, "");
			}

			return out;
		}



		/**
		 * Swaps the casing of a String.
		 * @param value Input String
		 * @returns Output String
		 */
		public static function swapCase(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.replace(/(\w)/, swapCase2);
			}

			return out;
		}



		/**
		 * Removes whitespace from the front and the end of the specified String.
		 * @param value String whose beginning and ending whitespace will be removed
		 * @return Output String
		 */
		public static function trim(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.replace(/^\s+|\s+$/g, "");
			}

			return out;
		}



		/**
		 * Removes whitespace from the front (left-side) of the specified String.
		 * @param value String whose beginning whitespace will be removed
		 * @returns Output String
		 */
		public static function trimLeft(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.replace(/^\s+/, "");
			}

			return out;
		}



		/**
		 * Removes whitespace from the end (right-side) of the specified String.
		 * @param value String whose ending whitespace will be removed
		 * @returns Output String
		 */
		public static function trimRight(value:String):String {
			var out:String = "";

			if(value != null) {
				out = value.replace(/\s+$/, "");
			}

			return out;
		}



		/**
		 * Determins the number of words in a String.
		 * @param value Input String
		 * @returns Number of words in a String
		 */
		public static function wordCount(value:String):uint {
			var out:uint = 0;

			if(value != null) {
				out = value.match(/\b\w+\b/g).length;
			}

			return out;
		}



		/**
		 * Returns a String truncated to a specified length with optional suffix.
		 * @param value Input String
		 * @param length Length the String should be shortend to
		 * @param suffix (optional, default="...") String to append to the end of the truncated String
		 * @returns String String truncated to a specified length with optional suffix
		 */
		public static function truncate(value:String, length:uint, suffix:String = "..."):String {
			var out:String = "";
			var l:uint = length;

			if(value != null) {
				l -= suffix.length;

				var trunc:String = value;

				if(trunc.length > l) {
					trunc = trunc.substr(0, l);

					if(/[^\s]/.test(value.charAt(l))) {
						trunc = trimRight(trunc.replace(/\w+$|\s+$/, ""));
					}

					trunc += suffix;
				}

				out = trunc;
			}

			return out;
		}



		public static function repeat(n:uint, str:String = " "):String {
			return new Array(n + 1).join(str);
		}



		/**
		 * Convert an Array to a list.
		 * @param a Input Array
		 * @return List as "item1, item2, item3"
		 */
		public static function arrayList(a:Array):String {
			var out:String = "";

			for each(var i:String in a) {
				out += i + ", ";
			}

			return out.substr(0, out.length - 2);
		}



		/**
		 * Convert a counting locale text. Useful when counting singulars vs. plurals.
		 * Example: Máš %d nepřečtených zpráv\0:Máš %d nepřečtených zpráv\1Máš %d nepřečtenou zprávu\2Máš %d nepřečtené zprávy\3Máš %d nepřečtené zprávy\4Máš %d nepřečtené zprávy
		 * @param mask
		 * @param value
		 * @return Counter part
		 */
		public static function convertCounterString(mask:String, value:uint):String {
			var out:String = mask;

			for each(var p:String in mask.split(/\|:/)) {
				var c:String = p.charAt(0);
				if((c != "?" && uint(c) == Math.abs(value)) || c == "?") out = printf(p.substr(2), value);
			}

			return out;
		}



		/**
		 * Convert bytes to a String ("X B" or "X kB")
		 * @param value Bytes count
		 * @return Result String
		 */
		public static function convertBytesString(value:uint):String {
			return (value <= 8192 ? (String(value) + " B") : (String(ConversionUtils.bytesToKilobytes(value)) + " kB"));
		}



		/**
		 * Convert seconds to a humanized String.
		 * @param seconds Seconds
		 * @return Humanized String
		 */
		public static function humanizeTime(seconds:uint, formatSeconds:String = "|:?=%d seconds|:1=jednu second",
		                                    formatMinutes:String = "|:?=%d minutes|:1=%d minute", formatHours:String = "|:?=%d hours|:1=%d hour",
		                                    formatDays:String = "|:?=%d days|:1=%d day"):String {
			//noinspection OverlyComplexArithmeticExpressionJS
			var days:int = int(seconds / 86400);

			//noinspection OverlyComplexArithmeticExpressionJS
			var hours:int = int((seconds - days * 86400) / 3600);

			//noinspection OverlyComplexArithmeticExpressionJS
			var minutes:int = int(((seconds - days * 86400) - hours * 3600) / 60);

			//noinspection OverlyComplexArithmeticExpressionJS
			var secondsTrimmed:int = seconds - (days * 86400) - (hours * 3600) - (minutes * 60);

			var out:String;

			if(out == null && seconds < 60) {
				// less than a minute
				out = convertCounterString(formatSeconds, seconds);
			}

			if(out == null && seconds < 60 * 60) {
				// minute to one hour
				if(seconds % 60 == 0) {
					out = convertCounterString(formatMinutes, minutes);
				}
				else {
					out = convertCounterString(formatMinutes, minutes) + ", " + convertCounterString(formatSeconds, secondsTrimmed);
				}
			}

			if(out == null && seconds < 60 * 60 * 24) {
				// hour to a day
				if(minutes % 60 == 0) {
					out = convertCounterString(formatHours, hours);
				}
				else {
					out = convertCounterString(formatHours, hours) + ", " + convertCounterString(formatMinutes, minutes);
				}
			}

			if(out == null) {
				// days
				if(hours % 24 == 0) {
					out = convertCounterString(formatDays, days);
				}
				else {
					out = convertCounterString(formatDays, days) + ", " + convertCounterString(formatHours, hours);
				}
			}

			return out;
		}



		private static function escapePattern2(value:String):String {
			return value.replace(/(\]|\[|\{|\}|\(|\)|\*|\+|\?|\.|\\)/g, "\\$1");
		}



		private static function minimum2(a:uint, b:uint, c:uint):uint {
			return Math.min(a, Math.min(b, Math.min(c, a)));
		}



		private static function quote2(value:String, ...args):String {
			var out:String;

			switch(value) {
				case "\\":
					out = "\\\\";
					break;

				case "\r":
					out = "\\r";
					break;

				case "\n":
					out = "\\n";
					break;

				case "\"":
					out = "\\";
					break;

				default:
					out = "";
			}

			return out;
		}



		private static function upperCase2(ch:String, ...args):String {
			return ch.toUpperCase();
		}



		private static function swapCase2(ch:String, ...args):String {
			var out:String;
			var lowChar:String = ch.toLowerCase();
			var upChar:String = ch.toUpperCase();

			switch(ch) {
				case lowChar:
					out = upChar;
					break;

				case upChar:
					out = lowChar;
					break;

				default:
					out = ch;
			}

			return out;
		}
	}
}
