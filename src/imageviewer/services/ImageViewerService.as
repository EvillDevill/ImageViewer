package imageviewer.services 
{
	/**
	 * ...
	 * @author evilMax
	 */
	public class ImageViewerService implements ILoadService
	{
		private var _assetLoaderManager:AssetsLoadersManager;
		public function ImageViewerService() 
		{
			_assetLoaderManager = new AssetsLoadersManager();
		}
		
		/* INTERFACE imageviewer.services.ILoadService */
		
		public function loadImageList(URL:String, onComplete:Function):void 
		{
			_assetLoaderManager.loadAsset(URL, AssetsLoadersManager.TEXT_FIlE, onComplete);
		}
		
		public function loadImage(URL:String, onComplete:Function):void 
		{
			_assetLoaderManager.loadAsset(URL, AssetsLoadersManager.ASSET_FIlE, onComplete);
		}
		
	}

}