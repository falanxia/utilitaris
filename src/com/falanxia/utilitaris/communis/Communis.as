/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.communis {
	import flash.events.EventDispatcher;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class Communis extends EventDispatcher {

		private static var INSTANCE:Communis;

		private var API_KEY:String;
		private var TARGET:String;

		/**
		 * Singleton constructor
		 * @param s
		 */
		public function Communis(s:Senf) {
			super();
			if (s==null) throw new Error("Communis is singleton, use getInstance()..");
			TARGET = "";
		}

		/**
		 * Provides static access to Communis
		 * @return Communis Communis singleton instance
		 */
		public function getInstance():Communis {
			if (INSTANCE==null) INSTANCE = new Communis(new Senf());
			return INSTANCE;
		}

		/**
		 * Init Communis
		 * @param apiKey application key
		 */
		public function init(apiKey:String,url:String=null,host:String=null,port:String=null,path:String=null):void {
			this.API_KEY = apiKey;

			if (url!=null) {
				TARGET = url;
				return;
			}

			if (host!=null) {
				if (port==null) throw new Error("Communis.init(): No port specified for host " + host);

				if (host.substr(0,4).toLowerCase()=="http") {
					TARGET+=host;
				} else {
					TARGET="HTTP://"+host;
				}

				if (TARGET.substr(TARGET.length-1,TARGET.length)=="/") {
					TARGET = TARGET.substr(0,TARGET.length-1);
				}
				TARGET = TARGET+":"+port+"/";

				if (path!=null) {
					if (path.charAt(0)=="/") {
						TARGET+=path.substr(1,path.length);
					} else {
						TARGET+=path;
					}
				}


			}

			throw new Error("Communis.init(): No URL nor host specified");
		}

	}

}

class Senf {}
