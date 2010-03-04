/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.communis.core {

	import com.falanxia.jsonora.JSON;
	import com.falanxia.utilitaris.communis.Communis;
	import com.falanxia.utilitaris.communis.data.CommunisTargetData;
	import com.falanxia.utilitaris.communis.events.CommunisErrorEvent;
	import com.falanxia.utilitaris.communis.events.CommunisResponseEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since 1.0
	 * CommuniCaller is the core of Communis, it handles connections to Deferror server.
	 */
	public class CommunisCaller extends URLLoader {

		private var callerData:CommunisTargetData;
		private var messageFormat:uint;
		private var payload:ByteArray;
		private var responseData:ByteArray;
		private var msgData:ByteArray;
		private var communis:Communis;
		private var factory:CommunisFactory;
		private var callID:String;

		use namespace communis_ns;

		/**
		 * Constructor. To be called by CommunisFactory only.
		 */
		public function CommunisCaller() {
			super();

			preInit();
		}

		/**
		 * Inits the CommunisCaller.
		 * @param callerData callerData to be used when connecting.
		 * @param callID callID String, used for callback.
		 * @param targetFunction remote function to be called.
		 * @param params parameters to be passed to remote function.
		 * @param messageFormat specified by CommunisMessageFormat
		 * @param dispatchProgress true if we want to dispatch eventProgress
		 */
		communis_ns function init(callerData:CommunisTargetData,callID:String,targetFunction:String,params:Object,messageFormat:uint,dispatchProgress:Boolean):void {
			this.callerData = callerData;
			this.messageFormat = messageFormat;
			this.callID = callID;

			if (dispatchProgress) this.addEventListener("progress",progressHandler);


			payload = new ByteArray();
			payload.endian = Endian.LITTLE_ENDIAN;
			responseData = new ByteArray();
			responseData.endian = Endian.LITTLE_ENDIAN;
			msgData = new ByteArray();
			msgData.endian = Endian.LITTLE_ENDIAN;

			var o:Object = new Object();
			o.key = callerData.apiKey;
			o.call = targetFunction;
			o.args = params;

			msgData.writeMultiByte(JSON.encode(o),"utf-8");

			payload.writeUTFBytes("DREQ");
			payload.writeUnsignedInt(messageFormat);

			switch (messageFormat) {
				case CommunisMessageFormat.UNCOMPRESSED:
					break;
				case CommunisMessageFormat.COMPRESSED:
					msgData.compress();
					break;
			}

			payload.writeUnsignedInt(msgData.length);
			payload.writeBytes(msgData);
		}

		/**
		 * Sends a request to deferror server.
		 * @return false if callerData isnt specified.
		 */
		communis_ns function sendRequest():Boolean {
			if (callerData==null) return false;

			var req:URLRequest=new URLRequest(callerData.target);
			req.method = "post";
			req.data = payload;

			this.load(req);


			return true;
		}

		/**
		 * Called by CommunisFactory, frees a CommunisCaller and returns it to factory products vector.
 		 */
		communis_ns function free():void {
			callerData = null;
			payload.clear();
			msgData.clear();
			responseData.clear();
		}

		/**
		 * Destroys a CommunisCaller, called when destroying whole Communis.
		 */
		communis_ns function destroy():void {
			this.close();

			this.removeEventListener("complete", loadedHandler);
			this.removeEventListener("ioError" ,ioErrorHandler);
			this.removeEventListener("securityError" ,securityErrorHandler);
			if (this.hasEventListener("progress")) this.removeEventListener("progress",progressHandler);

			callerData = null;
			payload.clear();
			payload = null
			responseData.clear();
			responseData = null;
			msgData.clear();
			msgData = null;
			communis = null;
			factory = null;
		}

		/**
		 * Dispatched when loading completes and response is recieved,delegates event to Communis dispatcher.
		 * @param e Event.COMPLETE
		 */
		private function loadedHandler(e:Event):void {

			if (this.hasEventListener("progress")) this.removeEventListener("progress",progressHandler);
			responseData.writeBytes(ByteArray(e.target.data),12);

			switch (messageFormat) {
				case CommunisMessageFormat.UNCOMPRESSED:
					break;
				case CommunisMessageFormat.COMPRESSED:
					responseData.uncompress();
					break;
			}

			var o:Object = JSON.decode(responseData.toString());

			var event:CommunisResponseEvent = new CommunisResponseEvent("comm:"+callID);
			event.status = o.status;
			event.statusMessage = o.statusMessage;
			event.found = o.found;
			event.data = o.data;

			communis.dispatchEvent(event);
			factory.destroyCaller(this);
		}

		/**
		 * Dispatched if caller is inited with dispatchProgress parameter set to true,delegates event to Communis
		 * dispatcher.
		 * @param e
		 */
		private function progressHandler(e:ProgressEvent):void {
			communis.dispatchEvent(new ProgressEvent("comm:progress:"+this.callID,false,false,e.bytesLoaded,e.bytesTotal));
		}

		/**
		 * Dispatched on IOError, delegates event to Communis dispatcher.
		 * @param e
		 */
		private function ioErrorHandler(e:IOErrorEvent):void {
			var ev:CommunisErrorEvent = new CommunisErrorEvent("comm:error:"+this.callID);
			ev.errorMessage = 'Communis ioError: '+e.text;
			communis.dispatchEvent(ev);
		}

		/**
		 * Dispatched on securityError, delegates event to Communis dispatcher.
		 * @param e
		 */
		private function securityErrorHandler(e:SecurityErrorEvent):void {
			var ev:CommunisErrorEvent = new CommunisErrorEvent("comm:error:"+this.callID);
			ev.errorMessage = 'Communis securityError:  '+e.text;
			communis.dispatchEvent(ev);
		}

		/**
		 * Preinits the CommunisCaller, used only once in the lifecycle of CommuniCaller
		 */
		private function preInit():void {
			communis = Communis.getInstance();
			factory = CommunisFactory.getInstance();
			this.dataFormat = 'binary';
			payload = new ByteArray();
			payload.endian = Endian.LITTLE_ENDIAN;
			responseData = new ByteArray();
			responseData.endian = Endian.LITTLE_ENDIAN;
			msgData = new ByteArray();
			msgData.endian = Endian.LITTLE_ENDIAN;

			this.addEventListener("complete", loadedHandler);
			this.addEventListener("ioError" ,ioErrorHandler)
			this.addEventListener("securityError" ,securityErrorHandler);
		}

	}

}
