package imageviewer.views.UIUtils.imageview 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author evilMax
	 */
	public class ImageFactory 
	{
		
		public function ImageFactory() 
		{
			
		}
		
		public function createImg(type:String, bitmap:Bitmap):IImageView
		{
			var imageView:IImageView = factoryMethod(type);
			imageView.create(bitmap);
			return imageView;
		}
		
		protected function factoryMethod(type:String):IImageView
		{
			throw new Error("Abstract method: must be overridden in a subclass");
		}
	}

}