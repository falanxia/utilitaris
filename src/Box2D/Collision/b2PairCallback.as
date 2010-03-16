package Box2D.Collision{


	/**
	 * @private
	 */
	public class b2PairCallback {
		//virtual ~b2PairCallback() {}

		// This returns the new pair user data.
		public virtual function PairAdded(proxyUserData1:*, proxyUserData2:*):* {
			return null
		}



		;

		// This should free the pair's user data. In extreme circumstances, it is possible
		// this will be called with null pairUserData because the pair never existed.
		public virtual function PairRemoved(proxyUserData1:*, proxyUserData2:*, pairUserData:*):void {
		}



		;
	}
	;


}
