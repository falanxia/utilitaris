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
	import flash.utils.ByteArray;
	import flash.utils.describeType;



	/**
	 * Object utilities.
	 *
	 * @author Jackson Dunstan (<a href="http://jacksondunstan.com/articles/509">http://jacksondunstan.com/articles/509</a>)
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class ObjectUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws Error since the class could not be instantiated
		 */
		public function ObjectUtils() {
			throw new Error('The class cannot be instantiated');
		}



		/**
		 * Count the properties in an {@code Object}.
		 * @param obj {@code Object} to count the properties of
		 * @return {@code Number} of properties in the specified object. If the specified object is {@code null}, this is {@code 0}
		 * @todo Optimize for faster access (no static)
		 */
		public static function numProperties(obj:Object):int {
			var count:int = 0;

			for each(var prop:Object in obj) count++;

			return count;
		}



		/**
		 * Check if an {@code Object} has any properties.
		 * @param obj {@code Object} to check for properties
		 * @return If the specified {@code Object} has any properties. If the specified {@code Object} is {@code null}, this is {@code false}
		 * @todo Optimize for faster access (no static)
		 */
		public static function hasProperties(obj:Object):Boolean {
			for each(var prop:Object in obj) return true;

			return false;
		}



		/**
		 * Check if the properties of an {@code Object} are all the same.
		 * @param obj {@code Object} whose properties should be checked
		 * @param type Type to check the {@code Object}'s properties against
		 * @return If all of the properties of the specified {@code Object} are of the specified type
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function isUniformPropertyType(obj:Object, type:Class):Boolean {
			var out:Boolean = true;

			for each(var prop:Object in obj) {
				if(!(prop is type)) out = false;
			}

			return out;
		}



		/**
		 * Assign properties from params to an {@code Object}.
		 * @param obj Target {@code Object}
		 * @param params Source {@code Object}
		 * @todo Optimize for faster access (no static)
		 * @return Resulting {@code Object}
		 */
		public static function assign(obj:Object, params:Object):Object {
			var out:Object = (obj);

			for(var i:String in params) {
				//noinspection EmptyCatchBlockJS,UnusedCatchParameterJS
				try {
					out[i] = params[i];
				}
				catch(err:Error) {
				}
			}

			return out;
		}



		/**
		 * Clone an {@code Object}.
		 * @param source Source {@code Object}
		 * @return Cloned {@code Object}
		 * @todo Optimize for faster access (no static)
		 */
		public static function clone(source:*):Object {
			var copier:ByteArray = new ByteArray();

			copier.writeObject(Object(source));
			copier.position = 0;

			return copier.readObject();
		}



		/**
		 * Scan an {@code Object}.
		 * @param obj {@code Object} to be scanned
		 * @param depth Depth of scanning
		 * @return Scan result
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function inspect(obj:Object, depth:int = 2):String {
			return _scanObject(obj, depth, '');
		}



		/**
		 * Copy an {@code Object}.
		 * @param obj {@code Object} to copy
		 * @param into (optional) {@code Object} to copy into. If {@code null}, a new {@code Object} is created
		 * @return A one-level deep copy of the {@code Object} or null if the argument is {@code null}
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function copy(obj:Object, into:Object = null):Object {
			var i:Object = into;

			if(i == null) {
				i = {};
			}

			if(obj != null) {
				for(var o:* in obj) {
					i[o] = obj[o];
				}
			}

			return i;
		}



		/**
		 * Convert the {@code Object} to an {@code Array}. Note that the order of the {@code Array} is undefined.
		 * @param obj {@code Object} to convert
		 * @return An {@code Array} with all of the properties of the given {@code Object} or {@code null} if the given {@code Object} is {@code null}
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function toArray(obj:Object):Array {
			var out:Array;

			if(obj != null) {
				var ret:Array = [];
				for each (var prop:Object in obj) ret.push(prop);
				out = ret;
			}

			return out;
		}



		/**
		 * Convert an {@code Object} to a {@code String} of form: PROP: VAL&PROP: VAL where:
		 * <ul>
		 *      <li>PROP is a property</li>
		 *      <li>VAL is its corresponding value & is the specified optional delimiter</li>
		 * </ul>
		 * @param obj {@code Object} to convert
		 * @param delimiter (optional) Delimiter of property/value pairs
		 * @return An {@code String} of all property/value pairs delimited by the given {@code String} or {@code null} if the input {@code Object} or delimiter is {@code null}.
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function toString(obj:Object = null, delimiter:String = '\n'):String {
			var out:String;

			if(obj == null || delimiter == null) {
				out = '';
			}
			else {
				var ret:Array = [];
				for(var s:Object in obj) {
					ret.push(s + ': ' + obj[s]);
				}
				out = ret.join(delimiter);
			}

			return out;
		}



		/**
		 * Searches the first level properties of an {@code Object} for a another {@code Object}.
		 * @param obj {@code Object} to search in.
		 * @param member {@code Object} to search for.
		 * @return {@code true} if {@code Object} was found
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function contains(obj:Object, member:Object):Boolean {
			var out:Boolean;

			for(var prop:String in obj) {
				if(obj[prop] == member) {
					out = true;
				}
			}

			return out;
		}



		/**
		 * Uses the strict equality operator to determine if {@code Object} is {@code undefined}.
		 * @param obj {@code Object} to determine if {@code undefined}
		 * @return {@code true} if {@code Object} is {@code undefined}
		 * @todo Optimize for faster access (no static)
		 */
		public static function isUndefined(obj:Object):Boolean {
			return obj is undefined;
		}



		/**
		 * Uses the strict equality operator to determine if {@code Object} is {@code null}\.
		 * @param obj {@code Object} to determine if {@code null}.
		 * @return {@code true} if {@code Object} is {@code null}
		 * @todo Optimize for faster access (no static)
		 */
		public static function isNull(obj:Object):Boolean {
			return obj === null;
		}



		/**
		 * Determines if {@code Object} contains no value(s).
		 * @param obj {@code Object} to derimine if empty
		 * @return {@code true} if object is empty
		 * @example
		 *      <code>
		 *          var testNumber:Number;
		 *          var testArray:Array = [];
		 *          var testString:String = "";
		 *          var testObject:Object = new Object();
		 *          trace(ObjectUtils.isEmpty(testNumber)); // traces "true"
		 *          trace(ObjectUtils.isEmpty(testArray));  // traces "true"
		 *          trace(ObjectUtils.isEmpty(testString)); // traces "true"
		 *          trace(ObjectUtils.isEmpty(testObject)); // traces "true"
		 *      </code>
		 * @todo Optimize for faster access (no static)
		 * @todo Test
		 */
		public static function isEmpty(obj:*):Boolean {
			var out:Boolean;

			if(obj == undefined) {
				out = true;
			}

			if(obj is Number) {
				out = isNaN(obj);
			}

			if(obj is Array || obj is String) {
				out = obj.length == 0;
			}

			if(obj is Object) {
				for(var prop:String in obj) {
					out = false;
				}
			}

			return out;
		}



		/* ★ PRIVATE METHODS ★ */


		private static function _scanObject(obj:Object, depth:int, prefix:String):String {
			var out:String;

			if(depth < 1) {
				out = String(obj);
			}
			else {
				const classDef:XML = describeType(obj);
				var str:String = '';

				for each(var variable:XML in classDef.variable) {
					str += prefix + variable.@name + ' : ' + _scanObject(obj[variable.@name], depth - 1, prefix + '\t') + '\n';
				}

				for(var s:* in obj) {
					str += prefix + s + ' = ' + _scanObject(obj[s], depth - 1, prefix + '\t') + '\n';
				}

				//noinspection NestedConditionalExpressionJS,NegatedConditionalExpressionJS
				out = str == '' ? ((obj != null) ? obj + '' : 'null') : ('[' + classDef.@name + '] {\n' + str + prefix + '}\n');
			}

			return out;
		}
	}
}
