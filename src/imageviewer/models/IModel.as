package imageviewer.models 
{
	import imageviewer.services.Asset;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author evilMax
	 */
	public interface IModel 
	{
		function loadImgList(imgList:XML):void;
		function getImgUrl(offset:int):String;
		function prepareImg(asset:Asset):void;
		function get onImgLoaded():Signal
	}
	
}