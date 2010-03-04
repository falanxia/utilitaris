/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.communis {

	import com.falanxia.utilitaris.communis.core.CommunisCaller;
	import com.falanxia.utilitaris.communis.core.CommunisFactory;
	import com.falanxia.utilitaris.communis.core.CommunisMessageFormat;
	import com.falanxia.utilitaris.communis.core.communis_ns;
	import com.falanxia.utilitaris.communis.data.CommunisTargetData;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public class Communis extends EventDispatcher {

		private static var INSTANCE:Communis;

		private var targets:Dictionary;
		private var factory:CommunisFactory;

		use namespace communis_ns;

		/**
		 * Singleton constructor
		 * @param s Singleton enforcer;
		 */
		public function Communis(s:Senf) {
			super();
			if (s==null) throw new Error("Communis is singleton, use getInstance()..");

			targets = new Dictionary();
			factory = CommunisFactory.getInstance();
		}

		/**
		 * Provides static access to Communis
		 * @return Communis Communis singleton instance
		 */
		public static function getInstance():Communis {
			if (INSTANCE==null) INSTANCE = new Communis(new Senf());
			return INSTANCE;
		}

		/**
		 * Destroys Communis and all associated data. Dont forget to remove all eventListeners and null references to
		 * targetDatas.
		 */
		public function destroy():void {
			targets = null;
			factory.destroy();
			factory = null;
			INSTANCE = null;
		}

		/**
		 * Sends a request to Deferror server;
		 * @param targetName name of the CommunisTargetData
		 * @param callID uniq id to be used for callbacks. (Communis dispatches events in format
		 * dispatchEvent(new CommunisResponseEvent("comm:"+callID))
		 * @param targetFunction remote function name to be called
		 * @param params array of parameters to be passed to remote function call.
		 * @param messageFormat defined by CommunisMessageFormat, at the moment, possibilities are 1 for
		 * uncompressed communication and 2 for gzip compressed format.
		 * @param dispatchProgress set to true if we need associated CommunisCaller instance to
		 * dispatch progress events during loading
		 * @return Boolean false if target wasnt found in targetDictionary
		 */
		public function sendRequest(targetName:String, callID:String, targetFunction:String, params:Object=null, messageFormat:uint=CommunisMessageFormat.COMPRESSED, dispatchProgress:Boolean=false):Boolean {
			var target:CommunisTargetData = targets[targetName];
			if (target==null) return false;

			var caller:CommunisCaller = factory.getCaller();
			trace("CALLER",caller);
			caller.init(target, callID, targetFunction, params, messageFormat,dispatchProgress);
			caller.sendRequest();

			return true;
		}

		/**
		 * Adds target data to targetDictionary. We can use either url (whole connectionString) or
		 * host & port, or host,port and path, in format http://host:port/path. If the list already contains
		 * targetData with specified name, addTargetData overwrites it with new value.
		 * @param targetName name of the targetData (also key in dictionary hashmap)
		 * @param apiKey apikey to be used when using targetData
		 * @param url url to be used as connectionString
		 * @param host target host
		 * @param port target port
		 * @param path target path
		 */
		public function addTargetData(targetName:String, apiKey:String, url:String=null, host:String=null, port:String=null, path:String=null):void {
			createTargetData(apiKey,targetName,url,host,port,path);
		}

		/**
		 * Returns reference targetData specified by name.
		 * @param targetName name of targetData
		 * @return TargetData targetData reference, null if targetDictionary doesent contain targetData.
		 */
		public function getTargetData(targetName:String):CommunisTargetData {
			//return CommunisTargetData(targets[targetName]).clone();
			return targets[targetName];
		}

		/**
		 * Removes targetData from list
		 * @param targetName name of targetData
		 */
		public function removeTargetData(targetName:String):void {
			targets[targetName] = null;
		}

		/**
		 * Returns list of all targetDatas.
		 * @return Vector.<CommunisTargetData> Vector containing all targetDatas
		 */
		public function getTargets():Vector.<CommunisTargetData> {
			var v:Vector.<CommunisTargetData> = new Vector.<CommunisTargetData>();
			for each (var data:CommunisTargetData in targets) {
				v.push(data);
			}
			return v;
		}

		/**
		 * Creates targetData and stores it in targets.
		 * @param targetName name of the targetData (also key in dictionary hashmap)
		 * @param apiKey apikey to be used when using targetData
		 * @param url url to be used as connectionString
		 * @param host target host
		 * @param port target port
		 * @param path target path
		 */
		private function createTargetData(apiKey:String,targetName:String,url:String=null,host:String=null,port:String=null,path:String=null):void {
			var key:String;
			var target:String;

			key =  apiKey;

			if (url!=null) {
				if (url.substr(0,8)!="http://") {
					target='HTTP://'+host;
				}
				target = url;
				targets[targetName] = new CommunisTargetData(target,apiKey,targetName);

				return;
			}

			if (host!=null) {
				if (port==null) throw new Error("Communis.createTargetData(): No port specified for host " + host);

				if (host.substr(0,8).toLowerCase()=="http://") {
					target+=host;
				} else {
					target="HTTP://"+host;
				}

				if (target.substr(target.length-1,target.length)=="/") {
					target = target.substr(0,target.length-1);
				}
				target = target+":"+port+"/";

				if (path!=null) {
					if (path.charAt(0)=="/") {
						target+=path.substr(1,path.length);
					} else {
<<<<<<< .mine
						target+=path;
=======
						TARGET+=path;
>>>>>>> .r463
					}
				}

				targets[targetName] = new CommunisTargetData(target,apiKey,targetName);

				return;
			}

			throw new Error("Communis.createTargetData(): No URL and host specified");

		}

	}

}

class Senf {}
