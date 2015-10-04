package  
{
	/**
	 * ...
	 * @author evilMax
	 */
	public class Utils 
	{
		/**
		 * merge two sorted array and return new array that sorted in same way
		 * @param array1 - first sorted array
		 * @param array2 - second sorted array
		 */
		public static function concatSortedArray(array1:Array, array2:Array):Array
		{
			var result			:Array;
			var arr1SortType	:int;
			var arr2SortType	:int;
			var sortType		:int;
			arr1SortType = getSortType(array1);
			arr2SortType = getSortType(array2);
			if (arr1SortType == 0 && arr2SortType == 0)
			{
				result = array1.concat(array2);
				return result;
			}
			sortType = arr1SortType;
			if (sortType == 0)
			{
				arr1SortType 	= arr2SortType;
				sortType 		= arr2SortType;
			}
			if (arr1SortType != arr2SortType)
				throw new Error("The arrays are sorted in diferent ways!");
			
			result = array1.concat();
			var lastCheckedIndex:int = 0;
			var itemsToCheck:int = array1.length;
			var i:int;
			var j:int;
			for (i = 0; i < array2.length; i++) 
			{
				for (j = lastCheckedIndex; j < itemsToCheck; j++) 
				{
					if (compareFunction(result[j], array2[i]) != sortType)
					{
						result.splice(j, 0, array2[i]);
						lastCheckedIndex = j + 1;
						itemsToCheck++;
						break;
					}
				}
				if (j == itemsToCheck && lastCheckedIndex!=j+1)
				{
					result = result.concat(array2.slice(i, array2.length));
					break;
				}
			}
			return result;
		}
		
		/**
		 * comare two objects
		 * @param x - first comare object
		 * @param y - second comare object
		 * @return -1 - Ascending sort; 1 - Descending sort; 0 - No sort
		 */
		private static function compareFunction(x:Number, y:Number):int
		{
			if (x > y)
				return 1;
			if (x < y)
				return -1;
			else 
				return 0;
		}
		
		/**
		 * define sort type of array
		 * @return sort type
		 */
		private static function getSortType(array:Array):int
		{
			var sortType:int = 0;
			var currItemsSortType:int;
			for (var i:int = 0; i < array.length-1; i++) 
			{
				if (!(array[i] is Number) || !(array[i] is  Number))
					throw new Error("Some element of array is not integer");
				currItemsSortType = compareFunction(array[i], array[i + 1])
				if (sortType == 0)
					sortType = currItemsSortType;
				else if (sortType != currItemsSortType)
					throw new Error("array is not sorted!");
			}
			return sortType;
		}
	}

}