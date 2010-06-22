
package com.falanxia.utilitaris.antizmrd.checkmethods {

	import com.falanxia.utilitaris.antizmrd.AntiZmrd;

	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since 1.0
	 */
	public class AbstractCheckMethod {

		private var antiZmrd:AntiZmrd;

		/**
		 * Constructor.
		 */
		public function AbstractCheckMethod(antiZmrd:AntiZmrd) {
			this.antiZmrd = antiZmrd;
		}


		public function disableApplication():void {
			antiZmrd.doDisable();
		}



		public function checkFinished():void {
			antiZmrd.checkFinished();
		}
	}
}
