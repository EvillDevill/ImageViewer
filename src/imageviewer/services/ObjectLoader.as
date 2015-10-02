package imageviewer.services 
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	/**
	 * ...
	 * @author evilMax
	 */
	public class ObjectLoader extends AssetLoader 
	{
		private var _loader	:Loader;
		public function ObjectLoader(url:String) 
		{
			super(url);
		}
		
		override public function destroy():void 
		{
			if (_loader)
			{
				_loader.removeEventListener(Event.COMPLETE, onCompleteLoad);
				_loader.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
				_loader.close();
				_loader = null;
			}
			super.destroy();
		}
		
		override public function load(onLoadComplete:Function):void 
		{
			_onLoadComplete = onLoadComplete;
			var urlRequest:URLRequest = new URLRequest(url);
			var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteLoad);
			_loader.load(urlRequest, loaderContext);
		}
		
		private function onCompleteLoad(e:Event):void 
		{
			e.target.removeEventListener(Event.COMPLETE, onCompleteLoad);
			e.target.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError)
			_loaded = true;
			_loadedData = new Asset(_url, (e.target as LoaderInfo).content);
			applyCallback(_loadedData);
			_loader.unloadAndStop();
			_loader = null;
			_onLoadComplete.call(this, this);
		}
		
		private function onLoadError(e:IOErrorEvent):void 
		{
			
		}
		
	}

}