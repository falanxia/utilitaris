/*
 * Falanxia Bzoonk.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */
package de.polygonal.ds
{
	/**
	 * All objects stored in a PriorityQueue have to extend this class.
	 *
	 * I could have defined this as an interface, but this would force me to
	 * write getters for accessing the priority value.
	 */
	public class Prioritizable
	{
		public var priority:int;

		public function Prioritizable(priority:int = -1)
		{
			this.priority = priority;
		}

		public function toString():String
		{
			return "[Prioritizable, priority=" + priority + "]";
		}
	}
}
