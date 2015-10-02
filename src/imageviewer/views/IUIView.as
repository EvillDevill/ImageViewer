package imageviewer.views 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author evilMax
	 */
	public interface IUIView 
	{
		function set enable(value:Boolean):void;
		function destroy():void;
		function showNextImg(type:String, bitmap:Bitmap):void
	}
	
}