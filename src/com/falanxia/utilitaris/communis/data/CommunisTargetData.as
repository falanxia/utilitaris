/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.communis.data {

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 * This class is a helper class used by Communis to store essential connection data;
	 */
	public class CommunisTargetData extends Object {

		public var target:String;
		public var apiKey:String;
		public var targetName:String;



		/**
		 * Constructs CommunisTargetData instance; to be used only internally by Communis.
		 * @param target target connection string.
		 * @param apiKey connection apiKey
		 * @param targetName name of this CommunisTargetData
		 */
		public function CommunisTargetData(target:String,apiKey:String,targetName:String) {
			super();
			this.target = target;
			this.apiKey = apiKey;
			this.targetName = targetName;
		}

		/**
		 * Returns copy of this CommunisTargetData instance
		 * @return copy of this instance.
		 */
		public function clone():CommunisTargetData {
			return new CommunisTargetData(target,apiKey,targetName);
		}

	}
}
