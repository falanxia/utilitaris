/*
 * Copyright (c) 2010 Jakub Schimer
 */

package com.falanxia.utilitaris.logger {
	import com.falanxia.utilitaris.utils.*;
	import com.nesium.logging.*;

	import de.dev_lab.logging.*;
	import de.dev_lab.logging.publisher.*;

	import flash.display.*;



	/**
	 * The {@code String} publisher outputs the Log to a Trazzle.
	 * See more info about Trazzle here: http://www.nesium.com/products/trazzle
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class TrazzlePublisher implements IPublisher {


		private static var _trazzle:TrazzleLogger;



		/**
		 * Constructor.
		 */
		public function TrazzlePublisher(stageReference:Stage, appName:String) {
			if(_trazzle == null) {
				_trazzle = new TrazzleLogger();
				_trazzle.setParams(stageReference, appName);
			}
		}



		/**
		 * Outputs the message to the {@code String}.
		 * @param logLevel Log level
		 * @param object Message
		 */
		public function publish(logLevel:int, object:*, ...additional):void {
			var prefix:String;

			switch(logLevel) {
				case Logger.DEBUG:
					prefix = "d ";
					break;

				case Logger.INFO:
					prefix = "i ";
					break;

				case Logger.WARN:
					prefix = "w ";
					break;

				case Logger.ERROR:
					prefix = "e ";
					break;

				case Logger.FATAL:
					prefix = "f ";
					break;

				default:
					prefix = "";
			}

			if(object == null) object = "[null]";

			_trazzle.log(prefix + StringUtils.trim(String(object)), 4);
		}



		/**
		 * Clear.
		 * Trazzle has no clear method, so it's just a placeholder.
		 */
		public function clear():void {
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			clear();
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Get Trazzle reference.
		 * @return Reference to Trazzle
		 */
		public static function get trazzle():TrazzleLogger {
			return _trazzle;
		}
	}
}
