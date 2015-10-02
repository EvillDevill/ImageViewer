package imageviewer.services 
{
	/**
	 * ...
	 * @author evilMax
	 */
	public class Asset 
	{
		private var _url	:String;
		private var _data	:Object;
		public function Asset(url:String, data:Object ) 
		{
			_url	= url;
			_data	= data;
		}
		
		public function destroy():void
		{
			_data = null;
		}
		
		public function get url():String 
		{
			return _url;
		}
		
		public function get data():Object 
		{
			return _data;
		}
		
	}

}