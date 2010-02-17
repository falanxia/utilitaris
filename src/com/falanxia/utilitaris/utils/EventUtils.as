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
	import flash.events.EventDispatcher;



	/**
	 * Event utilities.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class EventUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function EventUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Basically an {@code addEventListener()} for more events at once.
		 * Just saves few lines of code, nothing special.
		 * @param obj Target {@code EventDispatcher}
		 * @param params Multiple {@code Object}s with pairs {{@code event}: ..., {@code method}: ...}
		 */
		public static function addEventListeners(obj:EventDispatcher, ... params):void {
			for each(var i:Object in params) {
				if(i.event == undefined) throw new Error("Event undefined");
				if(i.method == undefined) throw new Error("Method undefined");

				obj.addEventListener(i.event, i.method, false, 0, true);
			}
		}



		/**
		 * Basically an {@code removeEventListener()} for more events at once.
		 * Just saves few lines of code, nothing special.
		 * @param obj Target {@code EventDispatcher}
		 * @param params Multiple {@code Object}s with pairs {{@code event}: ..., {@code method}: ...}
		 */
		public static function removeEventListeners(obj:EventDispatcher, ... params):void {
			for each(var i:Object in params) {
				if(i.event == undefined) throw new Error("Event undefined");
				if(i.method == undefined) throw new Error("Method undefined");

				obj.removeEventListener(i.event, i.method);
			}
		}
	}
}
