/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.antizmrd.checkmethods {

	import com.falanxia.utilitaris.antizmrd.AntiZmrd;
	import com.falanxia.utilitaris.antizmrd.helpers.DateCheckVO;

	
	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since 1.0
	 */
	public class ClientDateCheck extends AbstractCheckMethod implements ICheckMethod {

		private var dateCheckVO:DateCheckVO;

		/**
		 * Constructor.
		 */
		public function ClientDateCheck(antiZmrd:AntiZmrd, dateCheckVO:DateCheckVO) {
			super(antiZmrd);
			this.dateCheckVO = dateCheckVO;
		}



		public function doCheck():void {
			var date:Date = new Date();
			var now:Number = Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), date.getMilliseconds());
			var expire:Number = Date.UTC(dateCheckVO.year, dateCheckVO.month, dateCheckVO.day, dateCheckVO.hour, dateCheckVO.minute, dateCheckVO.second);

			if (expire - now < 0) {
				disableApplication();
			} else {
				checkFinished();
			}
		}



		public function destroy():void {
			dateCheckVO = null;
		}

	}

}
