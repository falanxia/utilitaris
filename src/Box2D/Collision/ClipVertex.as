package Box2D.Collision{


	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * @private
	 */
	public class ClipVertex {
		public var v:b2Vec2 = new b2Vec2();
		public var id:b2ContactID = new b2ContactID();
	}
	;


}
