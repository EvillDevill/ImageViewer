package imageviewer.services 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author evilMax
	 */
	public class TextAssetLoader extends AssetLoader 
	{
		private var _loader		:URLLoader;
		public function TextAssetLoader(url:String) 
		{
			super(url);
			
		}
		
		override public function destroy():void 
		{
			if (_loader)
			{
				_loader.removeEventListener(Event.COMPLETE, onCompleteLoad);
				_loader.removeEventListener(IOErrorEvent.IO_ERROR, onErrorLoad);
				_loader.close();
				_loader = null;
			}
			super.destroy();
		}
		
		override public function load(onLoadComplete:Function):void 
		{
			_onLoadComplete = onLoadComplete;
			var request:URLRequest = new URLRequest(_url);
			_loader	= new URLLoader();
			_loader.addEventListener(Event.COMPLETE, onCompleteLoad);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onErrorLoad);
			_loader.load(request);
		}
		
		private function onErrorLoad(e:IOErrorEvent):void 
		{
			
		}
		
		private function onCompleteLoad(e:Event):void 
		{
			_loader.removeEventListener(Event.COMPLETE, onCompleteLoad);
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, onErrorLoad);
			_loaded 	= true;
			_loadedData = new Asset(_url, _loader.data);
			applyCallback(_loadedData);
			_loader = null;
			_onLoadComplete.call(this, this);
		}
	}

}