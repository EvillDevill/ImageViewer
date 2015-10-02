package imageviewer.views.UIUtils.imageview 
{
	import flash.display.Bitmap;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public interface IImageView 
	{
		function create(bitmap:Bitmap):void
		function destroy():void;
		function show(onComplete:Function = null):void;
		function hide(onComplete:Function):void;
		function get onClick():Signal
	}
	
}