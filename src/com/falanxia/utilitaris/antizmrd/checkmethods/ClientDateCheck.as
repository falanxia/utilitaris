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

			if(expire - now < 0) {
				disableApplication();
			}
			else {
				checkFinished();
			}
		}



		public function destroy():void {
			dateCheckVO = null;
		}

	}

}
