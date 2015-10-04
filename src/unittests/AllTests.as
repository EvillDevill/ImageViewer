package unittests 
{
	import asunit.framework.TestSuite;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class AllTests extends TestSuite 
	{
		
		public function AllTests() 
		{
			super();
			addTest(new UtilsTest("TestSortAscendingArray"));
			addTest(new UtilsTest("testSortDescendingArray"));
			addTest(new UtilsTest("sortingTest1"));
			addTest(new UtilsTest("sortingTest2"));
			addTest(new UtilsTest("sortingTest3"));
		}
		
	}

}