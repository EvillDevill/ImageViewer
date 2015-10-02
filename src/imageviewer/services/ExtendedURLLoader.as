package imageviewer.services 
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class ExtendedURLLoader extends URLLoader 
	{
		private var _url:String;
		public function ExtendedURLLoader(request:URLRequest=null) 
		{
			super(request);
		}
		
		override public function load(request:URLRequest):void 
		{
			_url = request.url;
			super.load(request);
		}
		
		public function get url():String 
		{
			return _url;
		}
		
	}

}