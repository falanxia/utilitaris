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

package com.falanxia.utilitaris.utils {
	import flash.utils.ByteArray;
	import flash.utils.describeType;



	/**
	 * Object utilities.
	 *
	 * @author Jackson Dunstan (<a href="http://jacksondunstan.com/articles/509">http://jacksondunstan.com/articles/509</a>)
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class ObjectUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function ObjectUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Count the properties in an Object.
		 * @param obj Object to count the properties of
		 * @return Number of properties in the specified object. If the specified object is null, this is 0
		 */
		public static function numProperties(obj:Object):int {
			var count:int = 0;

			for each(var prop:Object in obj) count++;

			return count;
		}



		/**
		 * Check if an Object has any properties.
		 * @param obj Object to check for properties
		 * @return If the specified Object has any properties. If the specified Object is null, this is false
		 */
		public static function hasProperties(obj:Object):Boolean {
			for each(var prop:Object in obj) return true;
			return false;
		}



		/**
		 * Check if the properties of an Object are all the same.
		 * @param obj Object whose properties should be checked
		 * @param type Type to check the Object's properties against
		 * @return If all of the properties of the specified Object are of the specified type
		 */
		public static function isUniformPropertyType(obj:Object, type:Class):Boolean {
			var out:Boolean = true;

			for each(var prop:Object in obj) {
				if(!(prop is type)) out = false;
			}

			return out;
		}



		/**
		 * Assign properties from params to an Object.
		 * @param obj Target Object
		 * @param params Source Object
		 * @return Resulting Object
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
		 * Clone an Object.
		 * @param source Source Object
		 * @return Cloned Object
		 */
		public static function clone(source:*):Object {
			var copier:ByteArray = new ByteArray();

			copier.writeObject(Object(source));
			copier.position = 0;

			return copier.readObject();
		}



		/**
		 * Scan an Object.
		 * @param obj Object to be scanned
		 * @param depth Depth of scanning
		 * @return Scan result
		 */
		public static function inspect(obj:Object, depth:int = 10, prefix:String = "\t"):String {
			return prefix + scanObject(obj, depth, prefix + "\t");
		}



		/**
		 * Copy an Object.
		 * @param obj Object to copy
		 * @param into (optional) Object to copy into. If null, a new Object is created
		 * @return A one-level deep copy of the Object or null if the argument is null
		 */
		public static function copy(obj:Object, into:Object = null):Object {
			var i:Object = into;

			if(i == null) {
				i = {};
			}

			if(obj != null) {
				for(var o:String in obj) {
					i[o] = obj[o];
				}
			}

			return i;
		}



		/**
		 * Convert the Object to an Array. Note that the order of the Array is undefined.
		 * @param obj Object to convert
		 * @return An Array with all of the properties of the given Object or null if the given Object is null
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
		 * Convert an Object to a String of form: PROP: VAL&PROP: VAL where:
		 * <ul>
		 *      <li>PROP is a property</li>
		 *      <li>VAL is its corresponding value & is the specified optional delimiter</li>
		 * </ul>
		 * @param obj Object to convert
		 * @param delimiter (optional) Delimiter of property/value pairs
		 * @return An String of all property/value pairs delimited by the given String or null if the input Object or delimiter is null.
		 */
		public static function toString(obj:Object = null, delimiter:String = "\n"):String {
			var out:String;

			if(obj == null || delimiter == null) {
				out = "";
			} else {
				var ret:Array = [];
				for(var s:String in obj) {
					ret.push(s + ":" + obj[s]);
				}
				out = ret.join(delimiter);
			}

			return out;
		}



		/**
		 * Searches the first level properties of an Object for a another Object.
		 * @param obj Object to search in.
		 * @param member Object to search for.
		 * @return true if Object was found
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
		 * Uses the strict equality operator to determine if Object is null\.
		 * @param obj Object to determine if null.
		 * @return true if Object is null
		 */
		public static function isNull(obj:Object):Boolean {
			return obj === null;
		}



		/**
		 * Determines if Object contains no value(s).
		 * @param obj Object to derimine if empty
		 * @return true if object is empty
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



		private static function scanObject(obj:Object, depth:int, prefix:String):String {
			var out:String;

			if(depth < 1) {
				out = obj is String ? "\"" + obj + "\"" : String(obj);
			} else {
				const classDef:XML = describeType(obj);
				var str:String = "";

				for each(var variable:XML in classDef.variable) {
					str += prefix + variable.@name + " = " + scanObject(obj[variable.@name], depth - 1, prefix + "\t") + "\n";
				}

				for(var s:String in obj) {
					str += prefix + s + "=" + scanObject(obj[s], depth - 1, prefix + "\t") + "\n";
				}

				//noinspection NestedConditionalExpressionJS,NegatedConditionalExpressionJS
				out = str == "" ? ((obj != null) ? (obj is String ? "\"" + obj + "\"" : obj + "") : "null") : ("[" + classDef.@name + "] {\n" + str + (prefix.substr(0, prefix.length - 1)) + "}");
			}

			return out;
		}
	}
}
