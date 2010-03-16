package Box2D.Dynamics{


	import Box2D.Collision.Shapes.*;
	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * Implement this class to provide collision filtering. In other words, you can implement
	 * this class if you want finer control over contact creation.
	 */
	public class b2ContactFilter {

		/**
		 * Return true if contact calculations should be performed between these two shapes.
		 * @warning for performance reasons this is only called when the AABBs begin to overlap.
		 */
		public virtual function ShouldCollide(shape1:b2Shape, shape2:b2Shape):Boolean {
			var filter1:b2FilterData = shape1.GetFilterData();
			var filter2:b2FilterData = shape2.GetFilterData();

			if(filter1.groupIndex == filter2.groupIndex && filter1.groupIndex != 0) {
				return filter1.groupIndex > 0;
			}

			var collide:Boolean = (filter1.maskBits & filter2.categoryBits) != 0 && (filter1.categoryBits & filter2.maskBits) != 0;
			return collide;
		}



		/**
		 * Return true if the given shape should be considered for ray intersection.
		 * By default, userData is cast as a b2Shape and collision is resolved according to ShouldCollide
		 * @see ShouldCollide()
		 * @see b2World#Raycast
		 * @param userData	arbitrary data passed from Raycast or RaycastOne
		 * @param shape		the shape that we are testing for filtering
		 * @return a Boolean, with a value of false indicating that this shape should be ignored.
		 */
		public virtual function RayCollide(userData:*, shape:b2Shape):Boolean {
			if(!userData)
				return true;
			return ShouldCollide(userData as b2Shape, shape);
		}



		static b2internal var b2_defaultFilter:b2ContactFilter = new b2ContactFilter();

	}
	;

}
