package de.polygonal.ds.sort
{
	public class SortOptions
	{
		/**
		 * A flag that specifies the insertion sort algorithm. You can use this
		 * constant for the options parameter in the sort() method.
		 *
		 * @see de.polygonal.ds.SLinkedList#sort()
		 * @see de.polygonal.ds.DLinkedList#sort()
		 */
		public static const INSERTION_SORT:int   = 1 << 1;

		/**
		 * A flag that Specifies character-string sorting. You can use this
		 * constant for the options parameter in the sort() method.
		 *
		 * @see de.polygonal.ds.SLinkedList#sort()
		 * @see de.polygonal.ds.DLinkedList#sort()
		 */
		public static const CHARACTER_STRING:int = 1 << 2;

		/**
		 * A flag that specifies case-insensitive sorting. You can use this
		 * constant for the options parameter in the sort() method.
		 *
		 * @see de.polygonal.ds.SLinkedList#sort()
		 * @see de.polygonal.ds.DLinkedList#sort()
		 */
		public static const CASEINSENSITIVE:int = 1 << 3;

		/**
		 * A flag that specifies descending sorting. You can use this
		 * constant for the options parameter in the sort() method.
		 *
 		 * @see de.polygonal.ds.SLinkedList#sort()
		 * @see de.polygonal.ds.DLinkedList#sort()
		 */
		public static const DESCENDING:int = 1 << 4;
	}
}
