package imageviewer.views.UIUtils.buttons 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class SimpleButton extends Sprite 
	{
		private var _enable			:Boolean;
		private var _onClickHandler	:Function;
		
		protected var _onClickParams	:Array;
		public function SimpleButton(onClickHandler:Function, ... onClickParams) 
		{
			super();
			_onClickHandler	 	= onClickHandler;
			_onClickParams		= onClickParams;
			addEventListener(MouseEvent.CLICK, onMouseClick);
			_enable				= true;
		}
		
		public function destroy():void
		{
			removeEventListener(MouseEvent.CLICK, onMouseClick);			
			_onClickHandler 	= null;
			_onClickParams  	= null;
			if (parent)
				parent.removeChild(this);
		}
		
		public function set enable(value:Boolean):void
		{
			_enable = value;
		}
		
		public function get enable():Boolean 
		{
			return _enable;
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			if (!_enable)
				return;
			_onClickHandler.apply(this, _onClickParams);
		}
		
	}

}