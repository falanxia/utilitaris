package de.polygonal.ds
{
	/**
	 * A 'java-style' iterator interface.
	 */
	public interface Iterator
	{
		/**
		 * Returns the current item and moves the iterator to the next item
		 * in the collection. Note that the next() method returns the
		 * <i>first</i> item in the collection when it's first called.
		 *
		 * @return The next item in the collection.
		 */
		function next():*

		/**
		 * Checks if a next item exists.
		 *
		 * @return True if a next item exists, otherwise false.
		 */
		function hasNext():Boolean

		/**
		 * Moves the iterator to the first item in the collection.
		 */
		function start():void

		/**
		 * Grants access to the current item being referenced by the iterator.
		 * This provides a quick way to read or write the current data.
		 */
		function get data():*

		/**
		 * @private
		 */
		function set data(obj:*):void
	}
}

