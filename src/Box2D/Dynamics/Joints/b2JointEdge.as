package Box2D.Dynamics.Joints{


	import Box2D.Common.b2internal;
	import Box2D.Dynamics.*;



	use namespace b2internal;


	/**
	 * A joint edge is used to connect bodies and joints together
	 * in a joint graph where each body is a node and each joint
	 * is an edge. A joint edge belongs to a doubly linked list
	 * maintained in each attached body. Each joint has two joint
	 * nodes, one for each attached body.
	 */

	public class b2JointEdge {

		/** Provides quick access to the other body attached. */
		public var other:b2Body;
		/** The joint */
		public var joint:b2Joint;
		/** The previous joint edge in the body's joint list */
		public var prev:b2JointEdge;
		/** The next joint edge in the body's joint list */
		public var next:b2JointEdge;
	}

}
