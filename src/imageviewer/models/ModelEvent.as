package imageviewer.models 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class ModelEvent extends Event 
	{
		public static const SHOW_IMG:String	= "showImg";
		
		private var _data:Object;
		public function ModelEvent(type:String, data:Object) 
		{
			_data = data;
			super(type);
		}
		
		override public function clone():Event 
		{
			return new ModelEvent(type, _data);
		}
		
		public function get data():Object 
		{
			return _data;
		}
	}

}