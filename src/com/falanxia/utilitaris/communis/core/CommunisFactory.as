/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.communis.core {
	import com.falanxia.utilitaris.collections.ArrayPicker;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since 1.0
	 * This class is used internally by Communis, basicly its factory pattern reducing need for instantiation
	 * of CommunisCallers.
	 */
	public class CommunisFactory {


		private static var INSTANCE:CommunisFactory;
		private var products:ArrayPicker;

		use namespace communis_ns;

		/**
		 * Constructor.
		 */
		public function CommunisFactory(s:SEnf) {
			if (s==null) throw new Error("CommunisFactory is singleton, use getInstance()")

			products = new ArrayPicker();
			products.init([]);

		}



		/**
		 * Returns instance of CommunisCaller, to be used in Communis only.
		 * @return
		 */
		communis_ns static function getInstance():CommunisFactory {
			if (INSTANCE ==null) INSTANCE = new CommunisFactory(new SEnf());

			return INSTANCE;
		}



		/**
		 * Destroys factory and all associated data. All uncompleted CommunisCallers will be closed.
		 */
		communis_ns function destroy():void {
			var a:Array = products.getReservedItems();
			var l:int = a.length;
			for (var i:int=0;i<l;i++) {
				CommunisCaller(a[i]).destroy();
			}

			products.returnAllToPool();

			a = products.getPool();
			l = a.length;
			for (i = 0;i<l;i++) {
				CommunisCaller(a[i]).destroy();
			}

			products.destroy();
			products = null;
		}

		/**
		 * Returns CommunisCaller from products. If all callers are in use, creates a new one and returns it.
		 * This method is to be used in Communis only.
		 * @return CommunisCaller CommunisCaller instance
		 */
		communis_ns function getCaller():CommunisCaller {
			var c:CommunisCaller = CommunisCaller(products.getFirstFromPool());
			if (c == null) {
				c = new CommunisCaller();
				products.addToPool(c);
				return CommunisCaller(products.getFirstFromPool());
			}
			return c;
		}

		/**
		 * Returns caller to products vector. To be used in Communis only.
		 * @param caller
		 */
		communis_ns function destroyCaller(caller:CommunisCaller):void {
			caller.free();
			products.returnToPool(caller);
		}

	}

}

class SEnf {}
