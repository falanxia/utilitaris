/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */
package de.polygonal.ds
{
	/**
	 * A weighted arc pointing to a graph node.
	 */
	public class GraphArc
	{
		/**
		 * The node that the arc points to.
		 */
		public var node:GraphNode;

		/**
		 * The weight (or cost) of the arc.
		 */
		public var weight:Number;

		/**
		 * Creates a new graph arc with a given weight.
		 *
		 * @param node   The graph node.
		 * @param weight The node's weight.
		 */
		public function GraphArc(node:GraphNode, weight:Number = 1)
		{
			this.node = node;
			this.weight = weight;
		}
	}
}
