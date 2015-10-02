package imageviewer.services 
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author evilMax
	 */
	public class AssetsLoadersManager 
	{
		public static const TEXT_FIlE	:String = "textFile";
		public static const ASSET_FIlE	:String = "assetFile";
		
		private const MAX_LOADING_COUNT	:int = 5;
		private const DELAY_BEFOR_START	:int = 100;
		private const LOAD_DELAY		:int = 300;
		
		private var _assetsLoaders		:Object;
		private var _currLoadingCount	:int;
		private var _turnToLoad			:Vector.<AssetLoader>;
		private var _loadingTurn		:Vector.<AssetLoader>;
		private var _loadInProcess		:Boolean;
		private var _loadTimeout		:uint;
		public function AssetsLoadersManager() 
		{
			_turnToLoad		= new Vector.<AssetLoader>();
			_loadingTurn	= new Vector.<AssetLoader>();
			_assetsLoaders	= new Object();
			_loadInProcess 	= false;
		}
		
		public function destroy():void
		{
			_loadingTurn = null;
			_turnToLoad = null;
			for (var name:String in _assetsLoaders) 
			{
				(_assetsLoaders[name] as AssetLoader).destroy();
			}
			_assetsLoaders = null;
			clearTimeout(_loadTimeout);
		}
		
		public function loadAsset(url:String, assetType:String, onComplete:Function):void
		{
			if (!_assetsLoaders[url])
				_assetsLoaders[url] = createAssetLoader(url, assetType);
				
			var assetLoader:AssetLoader = _assetsLoaders[url];
			assetLoader.addCallback(onComplete);
			if (assetLoader.loaded)
				return;
			_turnToLoad.push(assetLoader);
			if (!_loadInProcess)
			{
				_loadInProcess = true;
				_loadTimeout = setTimeout(load, DELAY_BEFOR_START);
			}
		}
		
		private function createAssetLoader(url:String, assetType:String):AssetLoader 
		{
			switch(assetType)
			{
				case TEXT_FIlE:		return new TextAssetLoader(url);	break;
				case ASSET_FIlE:	return new ObjectLoader(url);		break;
				default: throw new Error("Can not create loader for this type "+ assetType);
			}
			return null;
		}
		
		private function load():void 
		{
			if (_turnToLoad.length == 0)
			{
				_loadInProcess = false;
				return;
			}
			
			var assetLoader:AssetLoader;
			while (true)
			{
				if (_currLoadingCount == MAX_LOADING_COUNT || _turnToLoad.length == 0)
					break;
				_currLoadingCount++;
				assetLoader = _turnToLoad.pop();
				_loadingTurn.push(assetLoader);
				assetLoader.load(onLoadComplete);
			}
			_loadTimeout = setTimeout(load, LOAD_DELAY);
		}
		
		public function unload(assetUrl:String):void
		{
			if (!_assetsLoaders[assetUrl])
				return;
			var assetLoader:AssetLoader = _assetsLoaders[assetUrl];
			var index:int;
			index = _loadingTurn.indexOf(assetLoader);
			if (index != -1)
			{
				_currLoadingCount--;
				_loadingTurn.splice(index, 1);
			}
			index = _turnToLoad.indexOf(assetLoader);
			if (index != -1)
				_turnToLoad.indexOf(assetLoader);
			assetLoader.destroy();
			assetLoader = null;
		}
		
		private function onLoadComplete(assetLoader:AssetLoader):void 
		{
			var index:int = _loadingTurn.indexOf(assetLoader);
			_loadingTurn.splice(index, 1);
			_currLoadingCount--;
		}
		
	}

}