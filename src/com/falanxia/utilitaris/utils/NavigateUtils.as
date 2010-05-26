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
	import flash.net.*;



	/**
	 * Navigate utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class NavigateUtils {


		public static const WINDOW_SELF:String = "_self";
		public static const WINDOW_BLANK:String = "_blank";
		public static const WINDOW_PARENT:String = "_parent";
		public static const WINDOW_TOP:String = "_top";



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function NavigateUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Simlifies {@code navigateToURL} by allowing you to either use a {@code String} or an {@code URLRequest}
		 * reference to the URL. This method also helps prevent pop-up blocking by trying to use
		 * {@link NavigateUtils#openWindow} before calling {@code navigateToURL}.
		 * @param request A {@code String} or an {@code URLRequest} reference to the URL you wish to open/navigate to
		 * @param window Browser window or HTML frame in which to display the URL indicated by the {@code request} parameter
		 * @throws ArguementTypeError if you pass a value type other than a {@code String} or {@code URLRequest} to parameter {@code request}.
		 */
		//noinspection FunctionWithMultipleReturnPointsJS
		public static function openUrl(request:*, window:String = WINDOW_SELF):void {
			var r:* = request;

			if(r is String) {
				r = new URLRequest(r);
			}
			else {
				if(!(r is URLRequest
				    )) {
					throw new Error("request");
				}
			}

			//noinspection OverlyComplexBooleanExpressionJS
			if(window == WINDOW_BLANK && ExternalInterface.available && !LocationUtils.isIde() && request._data == null) {
				if(openWindow(r.url, window)) return
			}

			navigateToURL(r, window);
		}



		/**
		 * A Flash wrapper for JavaScript {@code window.open}.
		 * @param url Specifies the URL you wish to open/navigate to
		 * @param window Browser window or HTML frame in which to display the URL indicated by the {@code url} parameter
		 * @param features Defines the various window features to be included
		 * @return {@code true} if the window was successfully created
		 * @see <a href="http://google.com/search?q=JavaScript+window.open+documentation">JavaScript documentation for window.open</a>.
		 */
		public static function openWindow(url:String, window:String = WINDOW_BLANK, features:String = ""):Boolean {
			return ExternalInterface.call("function casaOpenWindow(url, windowOrName, features) { return window.open(url, windowOrName, features) != null; }", url, (window == WINDOW_BLANK) ? "casaWindow" + int(1000 * Math.random()) : window, features);
		}
	}
}
