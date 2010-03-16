package de.polygonal.ds.sort
{
	public function arrayedInsertionSort(a:Array):void
	{
		var k:Number = a.length;
		var j:int, val:Number;
		for (var i:int = 1; i < k; i++)
		{
			val = a[i]; j = i;
			while ((j > 0) && (a[int(j - 1)] > val))
			{
				a[j] = a[int(j - 1)];
				j--;
			}
			a[j] = val;
		}
	}
}
