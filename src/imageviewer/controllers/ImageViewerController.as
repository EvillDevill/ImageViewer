package imageviewer.controllers 
{
	import flash.events.Event;
	import imageviewer.Assets;
	import imageviewer.models.ImageViewerModel;
	import imageviewer.models.IModel;
	import imageviewer.services.Asset;
	import imageviewer.services.ILoadService;
	import imageviewer.services.ImageViewerService;
	import imageviewer.views.signal.SignalTypes;
	import imageviewer.views.UIEvent;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class ImageViewerController extends Command 
	{
		[Inject]
		public var signalType:String;
		
		[Inject]
		public var data:Object;
		
		[Inject]
		public var service:ILoadService;
		
		[Inject]
		public var imageViewerModel:IModel;
		
		public function ImageViewerController() 
		{
			super();
			
		}
		
		override public function execute():void 
		{
			switch(signalType)
			{
				case SignalTypes.START_UP: 
					service.loadImageList(Assets.IMAGE_LIST, onImageListLoaded);	
					break;
				case SignalTypes.SWITCH_IMG: 
					changeIMG(data as int);								
					break;
			}
			//startUpSignal.addOnce(addkj);
			/*switch(event.type)
			{
				case UIEvent.START_UP:
					service.loadImageList(Assets.IMAGE_LIST, onImageListLoaded);
				break;
				case UIEvent.SWITCH_IMG:
					changeIMG(event.data as int);
				break;
			}*/
			//_service
		}
		
		/**
		 * switch current image
		 * @param offset - offset according to which will be displayed next image
		 */ 
		private function changeIMG(offset:int):void 
		{
			var imgUrl:String;
			imgUrl = imageViewerModel.getImgUrl(offset);
			service.loadImage(imgUrl, imageViewerModel.prepareImg);
		}
		
		/**
		 * handler of loading list of images
		 * @param	imgListAsset - loaded asset
		 */
		private function onImageListLoaded(imgListAsset:Asset):void 
		{
			imageViewerModel.loadImgList(new XML(imgListAsset.data));
			changeIMG(0);
		}
	}

}