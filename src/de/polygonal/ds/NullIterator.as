package de.polygonal.ds
{
	/**
	 * An do-nothing iterator for structures that don't support iterators.
	 */
	public class NullIterator implements Iterator
	{
		/**
		 * Nullified behaviour.
		 */
		public function start():void
		{
		}

		/**
		 * Nullified behaviour.
		 */
		public function next():*
		{
			return null;
		}

		/**
		 * Nullified behaviour.
		 */
		public function hasNext():Boolean
		{
			return false;
		}

		/**
		 * Always returns null.
		 */
		public function get data():*
		{
			return null;
		}

		/**
		 * Nullified behaviour.
		 */
		public function set data(obj:*):void
		{
		}
	}
}

