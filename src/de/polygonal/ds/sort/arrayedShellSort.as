package de.polygonal.ds.sort
{
	public function arrayedShellSort(a:Array):void
	{
		var size:int = a.length;
		var i:int, j:int, increment:int, temp:int;

		increment = size >> 1;
		while (increment > 0)
		{
			for (i = increment; i < size; i++)
			{
				temp = a[j = i];
				while ((j >= increment) && (a[int(j - increment)] > temp))
				{
					a[j] = a[int(j - increment)];
					j -= increment;
				}
				a[j] = temp;
			}
			if (increment == 2)
				increment = 1;
			else
				increment /= 2.2;
		}
	}
}
