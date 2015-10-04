package unittests   
{
	import asunit.framework.TestCase;
	import imageviewer.Assets;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class UtilsTest extends TestCase 
	{
		
		public function UtilsTest(testMethod:String=null) 
		{
			super(testMethod);
			
		}
		
		public function TestSortAscendingArray():void
		{
			var i:int;
			var arr1:Array;
			var arr2:Array;
			var result:Array;
			var sortedArr:Array;
			
			arr1 = [1, 4, 7, 8];
			arr2 = [2, 4, 6, 9, 10, 11];
			result = [1, 2, 4, 4, 6, 7, 8, 9, 10, 11];
			sortedArr = Utils.concatSortedArray(arr1, arr2);
			assertEqualsArrays(result, sortedArr);
			
		}
		
		public function testSortDescendingArray():void
		{
			var i:int;
			var arr1:Array;
			var arr2:Array;
			var result:Array;
			var sortedArr:Array;
			
			arr1 = [7, 5, 2 ,0];
			arr2 = [10, 9, 1 ,-1, -4];
			result = [10, 9, 7, 5, 2, 1, 0, -1, -4];
			sortedArr = Utils.concatSortedArray(arr1, arr2);
			assertEqualsArrays(result, sortedArr);
		}
		
		public function sortingTest1():void
		{
			var i:int;
			var arr1:Array;
			var arr2:Array;
			var result:Array;
			var sortedArr:Array;
			
			arr1 = [];
			arr2 = [10, 9, 1 ,-1, -4];
			result = [10, 9, 1, -1, -4];
			sortedArr = Utils.concatSortedArray(arr1, arr2);
			assertEqualsArrays(result, sortedArr);
		}
		
		public function sortingTest2():void
		{
			var i:int;
			var arr1:Array;
			var arr2:Array;
			var result:Array;
			var sortedArr:Array;
			
			arr1 = [4, 4, 4, 4];
			arr2 = [10, 9, 1 ,-1, -4];
			result = [10, 9, 4, 4, 4, 4, 1, -1, -4];
			sortedArr = Utils.concatSortedArray(arr1, arr2);
			assertEqualsArrays(result, sortedArr);
		}
		
		public function sortingTest3():void
		{
			var i:int;
			var arr1:Array;
			var arr2:Array;
			var result:Array;
			var sortedArr:Array;
			
			arr1 = [1,2,3,6,8,12];
			arr2 = [10, 9, 1 ,-1, -4];
			assertThrows(Error, function():void { Utils.concatSortedArray(arr1, arr2);} );
		}
		
		public function sortingTest4():void
		{
			var i:int;
			var arr1:Array;
			var arr2:Array;
			var result:Array;
			var sortedArr:Array;
			
			arr1 = [4, 4, 4];
			arr2 = [5, 5, 5];
			result = [4, 4, 4, 5, 5, 5];
			sortedArr = Utils.concatSortedArray(arr1, arr2);
			assertEqualsArrays(result, sortedArr);
		}
	}

}