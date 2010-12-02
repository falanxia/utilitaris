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
	import flash.display.DisplayObject;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;



	/**
	 * Class utilities.
	 *
	 * @author Jackson Dunstan (<a href="http://jacksondunstan.com/articles/512">http://jacksondunstan.com/articles/512</a>)
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class ClassUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function ClassUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Checks if class implements an interface.
		 * @param checkedClass Class we want to check
		 * @param checkedInterface Interface we want to check for
		 * @return Boolean true if class implements interface, otherwise false
		 */
		public static function implementsInterface(checkedClass:Class, checkedInterface:Class):Boolean {
			var icls:String = getQualifiedClassName(checkedInterface);
			var arr:XMLList = describeType(checkedClass).factory.implementsInterface;

			for(var i:int = 0; i < arr.length(); i++) {
				if(String(arr[i].@type) == icls) return true;
			}

			return false;
		}



		/**
		 * Get the Class of an Object.
		 * @param obj DisplayObject to get the Class of
		 * @return Class of the given DisplayObject or null if the class cannot be determined
		 */
		public static function getClass(obj:Object):Class {
			var out:Class;

			//noinspection UnusedCatchParameterJS,EmptyCatchBlockJS
			try {
				var cn:String = getQualifiedClassName(obj);
				var gd:* = obj.loaderInfo.applicationDomain.getDefinition(cn);
				out = Class(gd);
			}
			catch(refError:ReferenceError) {
			}
			catch(typeError:TypeError) {
			}

			return out;
		}



		/**
		 * Get a Class by its fully-qualified name.
		 * @param className Fully-qualified name of the Class
		 * @return Class with the given name or null if none exists
		 */
		public static function getClassByName(className:String):Class {
			var out:Class;

			//noinspection UnusedCatchParameterJS,EmptyCatchBlockJS
			try {
				var dn:Object = getDefinitionByName(className);
				out = Class(dn);
			}
			catch(refError:ReferenceError) {
			}
			catch(typeError:TypeError) {
			}

			return out;
		}



		/**
		 * Get the Class of a DisplayObject.
		 * @param obj Object to get the Class of
		 * @return Class of the given Object or null if the class cannot be determined
		 */
		public static function getDisplayObjectClass(obj:Object):Class {
			var out:Class;

			if(obj != null) {
				//noinspection UnusedCatchParameterJS,EmptyCatchBlockJS
				try {
					var cn:String = getQualifiedClassName(obj);
					var dn:Object = getDefinitionByName(cn);
					var ret:Class = Class(dn);

					if(ret == null && obj is DisplayObject) {
						var dj:DisplayObject = DisplayObject(obj);
						out = getDisplayObjectClass(dj);
					}
				}
				catch(refError:ReferenceError) {
				}
				catch(typeError:TypeError) {
				}
			}

			return out;
		}



		/**
		 * Dynamically constructs a Class.
		 * @param type Class to create
		 * @param args Up to ten arguments to the constructor
		 * @return Dynamically created instance of the Class specified by type parameter
		 * @example
		 *      <code>
		 *          var bData:* = ClassUtils.construct(BitmapData, 200, 200);
		 *          trace(bData is BitmapData, bData.width);
		 *      </code>
		 */
		public static function construct(type:Class, ...args):* {
			var out:*;
			var l:uint = args.length;

			if(l == 0) return new type();

			switch(args.length) {
				case 0 :
					out = new type(); break;

				case 1 :
					out = new type(args[0]); break;

				case 2 :
					out = new type(args[0], args[1]); break;

				case 3 :
					out = new type(args[0], args[1], args[2]); break;

				case 4 :
					out = new type(args[0], args[1], args[2], args[3]); break;

				case 5 :
					out = new type(args[0], args[1], args[2], args[3], args[4]); break;

				case 6 :
					out = new type(args[0], args[1], args[2], args[3], args[4], args[5]); break;

				case 7 :
					out = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6]); break;

				case 8 :
					out = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]); break;

				case 9 :
					out = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]); break;

				case 10 :
					out = new type(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]); break;

				default:
					throw new Error("You have passed more arguments than this method accepts (Ten or less)");
			}

			return out;
		}
	}
}
