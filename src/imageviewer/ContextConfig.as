package imageviewer 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import imageviewer.controllers.ImageViewerController;
	import imageviewer.mediators.ImageViewerMediator;
	import imageviewer.models.ImageViewerModel;
	import imageviewer.models.IModel;
	import imageviewer.services.ILoadService;
	import imageviewer.services.ImageViewerService;
	import imageviewer.views.IUIView;
	import imageviewer.views.signal.ViewSignal;
	import imageviewer.views.UIEvent;
	import imageviewer.views.UIView;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class ContextConfig extends EventDispatcher implements IConfig 
	{
		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var signalMap:ISignalCommandMap;

		[Inject]
		public var commandMap:IEventCommandMap;

		[Inject]
		public var contextView:ContextView;
		public function ContextConfig() 
		{
			
		}
		
		/* INTERFACE robotlegs.bender.framework.api.IConfig */
		
		public function configure():void 
		{
			injector.map(IModel).toSingleton(ImageViewerModel);
			injector.map(ILoadService).toSingleton(ImageViewerService);
			mediatorMap.map(IUIView).toMediator(ImageViewerMediator);
			
			// Execute UserSignInCommand when UserEvent.SIGN_IN
			// is dispatched on the context's Event Dispatcher
			/*commandMap.map(UIEvent.START_UP, UIEvent).toCommand(ImageViewerController);
			commandMap.map(UIEvent.SWITCH_IMG, UIEvent).toCommand(ImageViewerController);*/
			
			signalMap.map(ViewSignal).toCommand(ImageViewerController);
			//signalMap.map(SwitchImg).toCommand(ImageViewerController);

			
			// The "view" property is a DisplayObjectContainer reference.
			// If this was a Flex application we would need to cast it
			// as an IVisualElementContainer and call addElement().
			contextView.view.addChild(new UIView());
			
		}
		
	}

}