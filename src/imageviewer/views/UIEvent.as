package imageviewer.views 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class UIEvent extends Event 
	{
		public static const SWITCH_IMG			:String = "switch_img";
		public static const START_UP			:String = "start_up";
		
		private var _data	:Object;
		
		public function UIEvent(type:String, data:Object=null) 
		{
			_data = data;
			super(type);
		}
		
		override public function clone():Event 
		{
			return new UIEvent(type, _data);
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
	}

}