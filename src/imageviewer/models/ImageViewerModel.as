package imageviewer.models 
{
	import flash.display.Bitmap;
	import flash.events.IEventDispatcher;
	import imageviewer.services.Asset;
	import imageviewer.services.ILoadService;
	import imageviewer.views.UIUtils.imageview.BitmapViewTypes;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author evilMax
	 */
	public class ImageViewerModel implements IModel
	{
		[Inject]
	    public var eventDispatcher:IEventDispatcher;
		
		private var _imagesUrl			:Vector.<String>
		private var _currentImgInd		:int;
		private var _onImgLoaded		:Signal;
		public function ImageViewerModel() 
		{
			_currentImgInd 	= 0;
			_imagesUrl 		= new Vector.<String>();
			_onImgLoaded 	= new Signal(String, Bitmap);
		}
		
		/* INTERFACE imageviewer.models.IModel */
		
		public function loadImgList(imgList:XML):void 
		{
			var len:int = imgList.image.length();
			for (var i:int = 0; i < len; i++) 
			{
				_imagesUrl.push(imgList.image[i].@url);
			}
		}
		
		public function getImgUrl(offset:int):String 
		{
			_currentImgInd+=offset;
			if (_currentImgInd > _imagesUrl.length - 1)
				_currentImgInd = 0;
			if (_currentImgInd < 0)
				_currentImgInd = _imagesUrl.length - 1;
			return _imagesUrl[_currentImgInd];
		}
		
		public function prepareImg(asset:Asset):void 
		{
			if (_imagesUrl[_currentImgInd] != asset.url)
				return;
			_onImgLoaded.dispatch(BitmapViewTypes.SIMPLE_BITMAP_VIEW, asset.data as Bitmap);
			//eventDispatcher.dispatchEvent(new ModelEvent(ModelEvent.SHOW_IMG, {type:BitmapViewTypes.SIMPLE_BITMAP_VIEW, bitmap:asset.data}));
		}
		
		public function get onImgLoaded():Signal 
		{
			return _onImgLoaded;
		}
		
	}

}