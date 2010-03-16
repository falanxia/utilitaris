package Box2D.Collision.Shapes{


	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * This structure is used to build edge shapes.
	 * @see b2EdgeShape
	 */
	public class b2EdgeChainDef extends b2ShapeDef {
		public function b2EdgeChainDef() {
			type = b2Shape.e_edgeShape;
			vertexCount = 0;
			isALoop = true;
			vertices = [];
		}



		/** The vertices in local coordinates. */
		public var vertices:Array;

		/** The number of vertices in the chain. */
		public var vertexCount:int;

		/** Whether to create an extra edge between the first and last vertices. */
		public var isALoop:Boolean;
	}
	;

}
