package Box2D.Collision.Shapes{


	import Box2D.Common.b2internal;



	use namespace b2internal;


	/**
	 * This holds contact filtering data.
	 */
	public class b2FilterData {
		public function Copy():b2FilterData {
			var copy:b2FilterData = new b2FilterData();
			copy.categoryBits = categoryBits;
			copy.maskBits = maskBits;
			copy.groupIndex = groupIndex;
			return copy;
		}



		/**
		 * The collision category bits. Normally you would just set one bit.
		 */
		public var categoryBits:uint = 0x0001;

		/**
		 * The collision mask bits. This states the categories that this
		 * shape would accept for collision.
		 */
		public var maskBits:uint = 0xFFFF;

		/**
		 * Collision groups allow a certain group of objects to never collide (negative)
		 * or always collide (positive). Zero means no collision group. Non-zero group
		 * filtering always wins against the mask bits.
		 */
		public var groupIndex:int = 0;
	}

}
