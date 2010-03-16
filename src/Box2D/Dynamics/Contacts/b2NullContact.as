package Box2D.Dynamics.Contacts{


	import Box2D.Common.b2internal;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	/**
	 * @private
	 */
	public class b2NullContact extends b2Contact {
		public function b2NullContact() {
		}



		b2internal override function Evaluate(l:b2ContactListener):void {
		}



		public override function GetManifolds():Array {
			return null;
		}
	}
	;

}
