package de.polygonal.ds.sort.compare
{
	public function compareStringCaseInSensitive(a:String, b:String):int
	{
		a = a.toLowerCase();
		b = b.toLowerCase();

		if (a.length + b.length > 2)
		{
			var r:int = 0;
			var k:int = a.length > b.length ? a.length : b.length;
			for (var i:int = 0; i < k; i++)
			{
				r = a.charCodeAt(i) - b.charCodeAt(i);
				if (r != 0)	break;
			}
			return r;
		}
		else
			return a.charCodeAt(0) - b.charCodeAt(0);
	}
}
