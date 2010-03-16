package de.polygonal.ds.sort
{
	import de.polygonal.ds.DListNode;
	public function dLinkedInsertionSortCmp(node:DListNode, cmp:Function, descending:Boolean = false):DListNode
	{
		if (!node || cmp == null) return null;

		var h:DListNode = node, p:DListNode, n:DListNode, m:DListNode, i:DListNode, val:*;

		if (descending)
		{
			n = h.next;
			while (n)
			{
				m = n.next;
				p = n.prev;

				if (cmp(p.data, n.data) < 0)
				{
					i = p;

					while (i.prev)
					{
						if (cmp(i.prev.data, n.data) < 0)
							i = i.prev;
						else
							break;
					}
					if (m)
					{
						p.next = m;
						m.prev = p;
					}
					else
						p.next = null;

					if (i == h)
					{
						n.prev = null;
						n.next = i;

						i.prev = n;
						h = n;
					}
					else
					{
						n.prev = i.prev;
						i.prev.next = n;

						n.next = i;
						i.prev = n;
					}
				}
				n = m;
			}
		}
		else
		{
			n = h.next;
			while (n)
			{
				m = n.next;
				p = n.prev;

				if (cmp(p.data, n.data) > 0)
				{
					i = p;

					while (i.prev)
					{
						if (cmp(i.prev.data, n.data) > 0)
							i = i.prev;
						else
							break;
					}
					if (m)
					{
						p.next = m;
						m.prev = p;
					}
					else
						p.next = null;

					if (i == h)
					{
						n.prev = null;
						n.next = i;

						i.prev = n;
						h = n;
					}
					else
					{
						n.prev = i.prev;
						i.prev.next = n;

						n.next = i;
						i.prev = n;
					}
				}
				n = m;
			}
		}

		return h;
	}
}
