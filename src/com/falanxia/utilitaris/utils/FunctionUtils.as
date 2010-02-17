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
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;



	/**
	 * Function utilities.
	 *
	 * @author Jackson Dunstan (<a href="http://jacksondunstan.com/articles/525">http://jacksondunstan.com/articles/525</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class FunctionUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function FunctionUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Get a stack trace.
		 * @return Stack trace
		 */
		public static function getStackTrace():String {
			return new Error().getStackTrace();
		}



		/**
		 * Get a {@code Class} from the clip's library.
		 * @param source Source {@code DisplayObject}
		 * @param className Name of the {@code Class} to get
		 * @return {@code Class} with the given name or {@code null} if it cannot be found
		 * @todo Test
		 */
		public function getClassFromLibrary(source:DisplayObject, className:String):Class {
			var out:Class;

			//noinspection UnusedCatchParameterJS,EmptyCatchBlockJS
			try {
				out = Class(source.loaderInfo.applicationDomain.getDefinition(className));
			}
			catch(refErr:ReferenceError) {
			}
			catch(typeErr:TypeError) {
			}

			return out;
		}



		/**
		 * Get an instance of a clip from the clip's library.
		 * @param source Source {@code DisplayObject}
		 * @param className Name of the clip's {@code Class} (aka. linkage ID)
		 * @return An instance of the clip with the given name or {@code null} if the {@code Class} cannot be found or the clip cannot be instantiated
		 * @todo Test
		 */
		public function getClipFromLibrary(source:DisplayObject, className:String):MovieClip {
			var out:MovieClip;
			var cls:Class = getClassFromLibrary(source, className);

			if(cls) {
				//noinspection UnusedCatchParameterJS,EmptyCatchBlockJS
				try {
					out = new cls();
				}
				catch(err:ArgumentError) {
				}
			}

			return out;
		}



		/**
		 * Get an instance of a {@code BitmapData} from the clip's library.
		 * @param source Source {@code DisplayObject}
		 * @param className Name of the {@code BitmapData}'s {@code Class} (aka. linkage ID)
		 * @return An instance of the {@code BitmapData} with the given name or {@code null} if the {@code Class} cannot be found or the {@code BitmapData} cannot be instantiated
		 * @todo Test
		 */
		public function getBitmapDataFromLibrary(source:DisplayObject, className:String):BitmapData {
			var out:BitmapData;
			var cls:Class = getClassFromLibrary(source, className);

			//noinspection UnusedCatchParameterJS,EmptyCatchBlockJS
			try {
				// Need to pass a width and height, but they are ignored
				out = new cls(0, 0);
			}
			catch(err:ArgumentError) {
			}

			return out;
		}
	}
}
