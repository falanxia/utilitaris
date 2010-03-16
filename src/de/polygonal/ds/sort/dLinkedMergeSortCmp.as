package de.polygonal.ds.sort
{
	import de.polygonal.ds.DListNode;
	public function dLinkedMergeSortCmp(node:DListNode, cmp:Function, descending:Boolean = false):DListNode
	{
		if (!node || cmp == null) return null;

		var h:DListNode = node, p:DListNode, q:DListNode, e:DListNode, tail:DListNode;
		var insize:int = 1, nmerges:int, psize:int, qsize:int, i:int;

		if (descending)
		{
			while (true)
			{
				p = h;
				h = tail = null;
				nmerges = 0;

				while (p)
				{
					nmerges++;

					for (i = 0, psize = 0, q = p; i < insize; i++)
					{
						psize++;
						q = q.next;
						if (!q) break;
					}

					qsize = insize;

					while (psize > 0 || (qsize > 0 && q))
					{
						if (psize == 0)
						{
							e = q; q = q.next; qsize--;
						}
						else
						if (qsize == 0 || !q)
						{
							e = p; p = p.next; psize--;
						}
						else
						if (cmp(p.data, q.data) >= 0)
						{
							e = p; p = p.next; psize--;
						}
						else
						{
							e = q; q = q.next; qsize--;
						}

						if (tail)
							tail.next = e;
						else
							h = e;

						e.prev = tail;
						tail = e;
					}
					p = q;
				}

				node.prev = tail;
				tail.next = null;
				if (nmerges <= 1)
				{
					return h;
					break;
				}
				insize <<= 1;
			}
		}
		else
		{
			while (true)
			{
				p = h;
				h = tail = null;
				nmerges = 0;

				while (p)
				{
					nmerges++;

					for (i = 0, psize = 0, q = p; i < insize; i++)
					{
						psize++;
						q = q.next;
						if (!q) break;
					}

					qsize = insize;

					while (psize > 0 || (qsize > 0 && q))
					{
						if (psize == 0)
						{
							e = q; q = q.next; qsize--;
						}
						else
						if (qsize == 0 || !q)
						{
							e = p; p = p.next; psize--;
						}
						else
						if (cmp(p.data, q.data) <= 0)
						{
							e = p; p = p.next; psize--;
						}
						else
						{
							e = q; q = q.next; qsize--;
						}

						if (tail)
							tail.next = e;
						else
							h = e;

						e.prev = tail;
						tail = e;
					}
					p = q;
				}

				node.prev = tail;
				tail.next = null;
				if (nmerges <= 1)
				{
					return h;
					break;
				}
				insize <<= 1;
			}
		}

		return null;
	}
}
