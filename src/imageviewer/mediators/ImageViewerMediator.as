package imageviewer.mediators 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import imageviewer.models.IModel;
	import imageviewer.views.IUIView;
	import imageviewer.views.signal.SignalTypes;
	import imageviewer.views.signal.ViewSignal;
	import imageviewer.views.UIEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class ImageViewerMediator extends Mediator 
	{
		[Inject]
		public var _UIView:IUIView;
		
		[Inject]
		public var _IMGViewerModel:IModel;
		
		[Inject]
		public var viewSignal:ViewSignal;
		
		public function ImageViewerMediator() 
		{
			super();
			
		}
		
		override public function initialize():void 
		{
			//super.initialize();
			addViewListener(UIEvent.SWITCH_IMG, onSwitchImg); 
			addViewListener(UIEvent.START_UP, onStartUp); 
			_IMGViewerModel.onImgLoaded.add(onShowImg);
		}
		
		private function onStartUp(e:Event):void 
		{
			viewSignal.dispatch(SignalTypes.START_UP, null);
		}
		
		private function onSwitchImg(e:UIEvent):void 
		{
			viewSignal.dispatch(SignalTypes.SWITCH_IMG, e.data);
		}
		
		private function onShowImg(type:String, bitmap:Bitmap):void 
		{
			_UIView.showNextImg(type, bitmap);
		}
	}

}