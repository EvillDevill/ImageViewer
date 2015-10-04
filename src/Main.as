package 
{
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import unittests.AllTests;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// entry point
			addChild(new App());
			
			// Unit test!
			/*var unitTests:TestRunner = new TestRunner();
			stage.addChild(unitTests);
			unitTests.start(AllTests, null, TestRunner.SHOW_TRACE);*/
		}
		
	}
	
}