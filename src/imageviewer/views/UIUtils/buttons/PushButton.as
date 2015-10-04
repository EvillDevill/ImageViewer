package imageviewer.views.UIUtils.buttons 
{
	import com.greensock.TweenMax;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class PushButton extends SimpleButton 
	{
		private var _entity:DisplayObject;
		public function PushButton(entity:Class, onClickHandler:Function, ...onClickParams) 
		{
			super(onClickHandler);
			_onClickParams = onClickParams;
			_entity = new entity();
			addChild(_entity);
			useHandCursor = true;
		}
		
		override protected function onMouseOut(e:MouseEvent):void 
		{
			super.onMouseOut(e);
			TweenMax.to(_entity, .2, { scaleX:1, scaleY:1 } );
		}
		
		override protected function onMouseOver(e:MouseEvent):void 
		{
			super.onMouseOver(e);
			TweenMax.to(_entity, .2, { scaleX:1.15, scaleY:1.15 } );
		}
		
		override public function destroy():void 
		{
			TweenMax.killTweensOf(_entity);
			removeChild(_entity);
			_entity = null;
			super.destroy();
		}
	}

}