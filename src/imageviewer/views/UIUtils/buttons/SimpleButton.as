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
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_enable				= true;
		}
		
		public function destroy():void
		{
			removeEventListener(MouseEvent.CLICK, onMouseClick);	
			removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
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
		
		protected function onMouseClick(e:MouseEvent):void 
		{
			if (!_enable)
				return;
			_onClickHandler.apply(this, _onClickParams);
		}
		
		protected function onMouseOut(e:MouseEvent):void 
		{
			
		}
		
		protected function onMouseOver(e:MouseEvent):void 
		{
			
			
		}
		
		
	}

}