package Box2D.Collision{

	import Box2D.Common.Math.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;

	/**
	 * A manifold point is a contact point belonging to a contact
	 * manifold. It holds details related to the geometry and dynamics
	 * of the contact points.
	 * The point is stored in local coordinates because CCD
	 * requires sub-stepping in which the separation is stale.
	 */
	public class b2ManifoldPoint {
		public function Reset():void {
			localPoint1.SetZero();
			localPoint2.SetZero();
			separation = 0.0;
			normalImpulse = 0.0;
			tangentImpulse = 0.0;
			id.key = 0;
		}



		public function Set(m:b2ManifoldPoint):void {
			localPoint1.SetV(m.localPoint1);
			localPoint2.SetV(m.localPoint2);
			separation = m.separation;
			normalImpulse = m.normalImpulse;
			tangentImpulse = m.tangentImpulse;
			id.key = m.id.key;
		}



		public var localPoint1:b2Vec2 = new b2Vec2();
		public var localPoint2:b2Vec2 = new b2Vec2();
		public var separation:Number;
		public var normalImpulse:Number;
		public var tangentImpulse:Number;
		public var id:b2ContactID = new b2ContactID();
	}
	;


}
