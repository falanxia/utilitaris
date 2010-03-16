package de.polygonal.ds.sort
{
	import de.polygonal.ds.SListNode;
	public function sLinkedMergeSortCmp(node:SListNode, cmp:Function, descending:Boolean = false):SListNode
	{
		if (!node || cmp == null) return null;

		var h:SListNode = node, p:SListNode, q:SListNode, e:SListNode, tail:SListNode;
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

						tail = e;
					}
					p = q;
				}

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

						tail = e;
					}
					p = q;
				}

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
