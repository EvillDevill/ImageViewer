package imageviewer.views.UIUtils.buttons 
{
	import flash.display.DisplayObject;
	
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
		}
		
		override public function destroy():void 
		{
			removeChild(_entity);
			_entity = null;
			super.destroy();
		}
	}

}