/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.soundlib {

	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @since
	 */
	public class SoundSystem {


		private static var INSTANCE:SoundSystem;

		private var soundTransform:SoundTransform;

		private var sounds:Vector.<SoundChannel>;



		/**
		 * Constructor.
		 */
		public function SoundSystem(s:Senf) {

			if(s == null) throw new Error("SoundSystem is sigleton, use getInstance()...");

		}



		public function getInstance():SoundSystem {

			if(INSTANCE == null) {

				INSTANCE = new SoundSystem(new Senf());

			}

			return INSTANCE;

		}



		public function init():void {

			this.soundTransform = SoundMixer.soundTransform;

			sounds = new Vector.<SoundChannel>();

		}



		public function setVolume(volume:Number):void {

			soundTransform.volume = volume;

		}


	}

}

class Senf {
}
