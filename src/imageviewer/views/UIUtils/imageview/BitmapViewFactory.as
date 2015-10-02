package imageviewer.views.UIUtils.imageview 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author evilMax
	 */
	public class BitmapViewFactory extends ImageFactory 
	{
		
		public function BitmapViewFactory() 
		{
			super();
		}
		
		override protected function factoryMethod(type:String):IImageView 
		{
			var bitmapView:IImageView;
			switch(type)
			{
				case BitmapViewTypes.SIMPLE_BITMAP_VIEW: bitmapView = new SimpleBitmapView(); break;
				default: throw new Error("Wrong type "+ type);
			}
			return bitmapView;
		}
		
	}

}