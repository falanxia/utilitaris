package de.polygonal.ds
{
	/**
	 * A doubly linked list node.
	 *
	 * Each node acts as a data container and stores a reference to next and
	 * previous node in the list.
	 */
	public class DListNode implements LinkedListNode
	{
		/**
		 * The node's data.
		 */
		public var data:*;

		/**
		 * The next node in the list being referenced.
		 */
		public var next:DListNode;

		/**
		 * The previous node in the list being referenced.
		 */
		public var prev:DListNode;

		/**
		 * Creates a new node storing a given item.
		 *
		 * @param obj The data to store inside the node.
		 */
		public function DListNode(obj:*)
		{
			next = prev = null;
			data = obj;
		}

		/**
		 * A helper function used solely by the DLinkedList class for inserting
		 * a given node after this node.
		 *
		 * @param node The node to insert.
		 */
		public function insertAfter(node:DListNode):void
		{
			node.next = next;
			node.prev = this;
			if (next) next.prev = node;
			next = node;
		}

		/**
		 * A helper function used solely by the DLinkedList class for inserting
		 * this node in front of a given node.
		 *
		 * @param node A doubly linked list node.
		 */
		public function insertBefore(node:DListNode):void
		{
			node.next = this;
			node.prev = prev;
			if (prev) prev.next = node;
			prev = node;
		}

		/**
		 * A helper function used solely by the DLinkedList class to unlink the
		 * node from the list.
		 */
		public function unlink():void
		{
			if (prev) prev.next = next;
			if (next) next.prev = prev;
			next = prev = null;
		}

		/**
		 * Prints out a string representing the current object.
		 *
		 * @return A string representing the current object.
		 */
		public function toString():String
		{
			return "[DListNode, data=" + data + "]";
		}
	}
}
