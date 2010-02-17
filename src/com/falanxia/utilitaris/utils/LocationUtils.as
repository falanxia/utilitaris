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
	import flash.system.Capabilities;



	/**
	 * Location utilities.
	 *
	 * @author Aaron Clinger and Jon Adams / Casalib (<a href="http://casalib.org">casalib.org</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class LocationUtils {



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an {@code Error}.
		 * @throws {@code Error} since the class could not be instantiated
		 */
		public function LocationUtils() {
			throw new Error('The class cannot be instantiated');
		}



		/**
		 * Determines if the SWF is being served on the internet.
		 * @param location {@code DisplayObject} to get location of
		 * @return {@code true} if SWF is being served on the internet
		 * @example
		 *      <code>
		 *          trace(LocationUtils.isWeb(_root));
		 *      </code>
		 */
		public static function isWeb(location:DisplayObject):Boolean {
			return location.loaderInfo.url.substr(0, 4) == 'http';
		}



		/**
		 * Detects if {@code MovieClip}'s embed location matches passed domain.
		 * @param location {@code MovieClip} to compare location of
		 * @param domain Web domain
		 * @return {@code true} if file's embed location matched passed domain
		 * @example Check for domain:
		 *      <code>
		 *          trace(LocationUtils.isDomain(_root, "google.com"));
		 *          trace(LocationUtils.isDomain(_root, "bbc.co.uk"));
		 *      </code>
		 * @example You can even check for subdomains:
		 *      <code>
		 *          trace(LocationUtils.isDomain(_root, "subdomain.aaronclinger.com"))
		 *      </code>
		 */
		public static function isDomain(location:DisplayObject, domain:String):Boolean {
			return getDomain(location).slice(-domain.length) == domain;
		}



		/**
		 * Detects {@code MovieClip}'s domain location.
		 * @param location {@code MovieClip} to get location of
		 * @return Full domain (including sub-domains) of {@code MovieClip}'s location
		 * @example
		 *      <code>
		 *          trace(LocationUtils.getDomain(_root));
		 *      </code>
		 * @usageNote Function does not return folder path or file name. The method also treats "www" and sans "www" as the same; if "www" is present method does not return it.
		 */
		public static function getDomain(location:DisplayObject):String {
			var baseUrl:String = location.loaderInfo.url.split('://')[1].split('/')[0];
			return (baseUrl.substr(0, 4) == 'www.') ? baseUrl.substr(4) : baseUrl;
		}



		/**
		 * Determines if the SWF is running in a browser plug-in.
		 * @return {@code true} if SWF is running in the Flash Player browser plug-in
		 */
		public static function isPlugin():Boolean {
			return Capabilities.playerType == 'PlugIn' || Capabilities.playerType == 'ActiveX';
		}



		/**
		 * Determines if the SWF is running in the IDE.
		 * @return {@code true} if SWF is running in the Flash Player version used by the external player or test movie mode
		 */
		public static function isIde():Boolean {
			return Capabilities.playerType == 'External';
		}



		/**
		 * Determines if the SWF is running in the StandAlone player.
		 * @return {@code true} if SWF is running in the Flash StandAlone Player
		 */
		public static function isStandAlone():Boolean {
			return Capabilities.playerType == 'StandAlone';
		}



		/**
		 * Determines if the runtime environment is an Air application.
		 * @return {@code true} if the runtime environment is an Air application
		 */
		public static function isAirApplication():Boolean {
			return Capabilities.playerType == 'Desktop';
		}
	}
}
