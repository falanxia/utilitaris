package de.polygonal.ds.sort.compare
{
	public function compareStringCaseSensitiveDesc(a:String, b:String):int
	{
		if (a.length + b.length > 2)
		{
			var r:int = 0;
			var k:int = a.length > b.length ? a.length : b.length;
			for (var i:int = 0; i < k; i++)
			{
				r = b.charCodeAt(i) - a.charCodeAt(i);
				if (r != 0)	break;
			}
			return r;
		}
		else
			return b.charCodeAt(0) - a.charCodeAt(0);
	}
}
