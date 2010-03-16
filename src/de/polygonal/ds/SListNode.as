package de.polygonal.ds
{
	/**
	 * A singly linked list node.
	 *
	 * Each node acts as a data container and stores a reference to the next node
	 * in the list.
	 */
	public class SListNode implements LinkedListNode
	{
		/**
		 * The node's data.
		 */
		public var data:*;

		/**
		 * The next node in the list being referenced.
		 */
		public var next:SListNode;

		/**
		 * Creates a new node storing a given item.
		 *
		 * @param obj The data to store inside the node.
		 */
		public function SListNode(obj:*)
		{
			data = obj;
			next = null;
		}

		/**
		 * A helper function used solely by the SLinkedList class for inserting
		 * a given node after this node.
		 *
		 * @param node The node to insert.
		 */
		public function insertAfter(node:SListNode):void
		{
			node.next = next;
			next = node;
		}

		/**
		 * Prints out a string representing the current object.
		 *
		 * @return A string representing the current object.
		 */
		public function toString():String
		{
			return "[SListNode, data=" + data + "]";
		}
	}
}
