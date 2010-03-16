package Box2D.Dynamics.Contacts{


	import Box2D.Common.b2internal;
	import Box2D.Dynamics.b2Body;



	use namespace b2internal;

	/**
	 * A contact edge is used to connect bodies and contacts together
	 * in a contact graph where each body is a node and each contact
	 * is an edge. A contact edge belongs to a doubly linked list
	 * maintained in each attached body. Each contact has two contact
	 * nodes, one for each attached body.
	 */
	public class b2ContactEdge {
		public var other:b2Body;
		public var contact:b2Contact;
		public var prev:b2ContactEdge;
		public var next:b2ContactEdge;
	}
	;


}
