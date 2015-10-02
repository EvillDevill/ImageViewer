package imageviewer.services 
{
	
	/**
	 * ...
	 * @author evilMax
	 */
	public interface ILoadService 
	{
		function loadImageList(URL:String, onComplete:Function):void;
		function loadImage(URL:String, onComplete:Function):void;
	}
	
}