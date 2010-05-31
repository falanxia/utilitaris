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
	import flash.external.*;



	/**
	 * Align utilities.
	 * @author Nemo design (<a href="http://nemodesign.com">nemodesign.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class JSUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function JSUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Call a JS function.
		 * @param func Name of the function to be called
		 * @param arg1 Argument 1
		 * @param arg2 Argument 2
		 * @param arg3 Argument 3
		 * @param arg4 Argument 4
		 * @throws Error if empty function name supplied
		 * @throws Error if {@code SecurityError} occured
		 * @throws Error if {@code Error} occured
		 */
		public static function callFunction(func:String, arg1:* = null, arg2:* = null, arg3:* = null, arg4:* = null):void {
			if(func == "") {
				throw new Error("A valid function argument must be supplied");
			}

			// track avea if a type is supplied
			if(ExternalInterface.available) {
				try {
					ExternalInterface.call(func, arg1, arg2, arg3, arg4);
				}
				catch(error:SecurityError) {
					throw new Error(func + " Tracking Request Failed. A SecurityError occurred: " + error.message + "\n");
				}
				catch (error:Error) {
					throw new Error(func + " Tracking Request Failed. An Error occurred: " + error.message + "\n");
				}
			}

			else {
				throw new Error(func + " Tracking Request Failed. External interface is not available for this container. If you're trying to use it locally, try using it through an HTTP address.");
			}
		}
	}
}
