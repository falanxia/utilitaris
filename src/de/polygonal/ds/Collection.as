/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */
package de.polygonal.ds
{
	/**
	 * A 'java-style' collection interface.
	 */
	public interface Collection
	{
		/**
		 * Determines if the collection contains a given item.
		 *
		 * @param obj The item to search for.
		 *
		 * @return True if the item exists, otherwise false.
		 */
		function contains(obj:*):Boolean

		/**
		 * Clears all items.
		 */
		function clear():void

		/**
		 * Initializes an iterator object pointing to the first item in the
		 * collection.
		 *
		 * @return An iterator object.
		 */
		function getIterator():Iterator

		/**
		 * The total number of items.
		 *
		 * @return The size.
		 */
		function get size():int;

		/**
		 * Checks if the collection is empty.
		 *
		 * @return True if empty, otherwise false.
		 */
		function isEmpty():Boolean

		/**
		 * Converts the collection into an array.
		 *
		 * @return An array.
		 */
		function toArray():Array
	}
}

