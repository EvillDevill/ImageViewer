package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import imageviewer.ContextConfig;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.contextView.ContextViewExtension;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.impl.Context;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class App extends Sprite 
	{
		private var _context:Context;
		public function App() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_context = new Context();
			_context.install(MVCSBundle, ContextViewExtension, SignalCommandMapExtension);
			_context.configure(new ContextView(this), ContextConfig);
			_context.initialize();
		}
		
	}

}