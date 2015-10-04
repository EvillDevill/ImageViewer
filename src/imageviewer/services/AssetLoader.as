package imageviewer.services 
{
	/**
	 * ...
	 * @author evilMax
	 */
	public class AssetLoader 
	{
		protected var _url					:String;
		protected var _onCompleteCallBacks	:Vector.<Function>;
		protected var _onLoadComplete		:Function;
		protected var _loaded				:Boolean;
		protected var _loadedData			:Asset;
		public function AssetLoader(url:String)
		{
			_url 				= url;
			_loaded				= false;
			_onCompleteCallBacks= new Vector.<Function>();
		}
		
		/**
		 * start load asset file
		 * @param	onLoadComplete - on load complete handler
		 */
		public function load(onLoadComplete:Function):void
		{
			throw new Error("This is abstract method. It must be overrid");
		}
		
		/**
		 * add callback in which, will be transmit loaded asset when loading wil be complete
		 * @param	callback
		 */
		public function addCallback(callback:Function):void
		{
			if (_loaded)
			{
				callback.call(this, _loadedData);
				return;
			}
			if(_onCompleteCallBacks.indexOf(callback)==-1)
				_onCompleteCallBacks.push(callback);
		}
		
		/**
		 * apply all callbacks
		 * @param	callback
		 */
		public function applyCallback(obj:Object):void
		{
			var i:int;
			var len:int = _onCompleteCallBacks.length;
			for (i = 0; i < len; i++) 
			{
				_onCompleteCallBacks[i].call(this, obj);
				_onCompleteCallBacks[i] = null;
			}
			_onCompleteCallBacks.splice(0, _onCompleteCallBacks.length);
		}
		
		public function destroy():void
		{
			_onCompleteCallBacks 	= null;
			_onLoadComplete			= null;
			_loadedData				= null;
		}
		
		public function get url():String 
		{
			return _url;
		}
		
		public function get loaded():Boolean 
		{
			return _loaded;
		}
		
	}

}