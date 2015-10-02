package imageviewer.views 
{
	import com.greensock.TweenMax;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import imageviewer.views.UIUtils.buttons.PushButton;
	import imageviewer.views.UIUtils.imageview.BitmapViewFactory;
	import imageviewer.views.UIUtils.imageview.IImageView;
	import imageviewer.views.UIUtils.imageview.ImageFactory;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class UIView extends Sprite implements IUIView
	{
		private var _nextImgBtn		:PushButton;
		private var _prevImgBtn		:PushButton;
		private var _currentImg		:IImageView;
		private var _imgFactory		:BitmapViewFactory;
		private var _nextImg		:IImageView;
		private var _enable			:Boolean;
		public function UIView() 
		{
			super();
			_enable		= true;
			_imgFactory = new BitmapViewFactory();
			addEventListener(Event.ADDED_TO_STAGE, create);
			//create();
		}
		
		private function create(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, create);
			dispatchEvent(new UIEvent(UIEvent.START_UP, null));
			//_startUp.dispatch();
			x = int(stage.stageWidth * .5);
			y = int(stage.stageHeight * .5);
			
			_nextImgBtn 	= new PushButton(LIB_ArrowButton, switchIMGHandler, 1);
			_nextImgBtn.x 	= int( stage.stageWidth * .5 - 50 );
			addChild(_nextImgBtn);
			
			_prevImgBtn 	= new PushButton(LIB_ArrowButton, switchIMGHandler, -1);
			_prevImgBtn.x 	= int( -stage.stageWidth * .5 + 50 );
			_prevImgBtn.scaleX = -1;
			addChild(_prevImgBtn);
			
		}
		
		private function switchIMGHandler(offset:int):void 
		{
			enable = false;
			dispatchEvent(new UIEvent(UIEvent.SWITCH_IMG, offset));
		}
		
		public function showNextImg(type:String, bitmap:Bitmap):void
		{
			_nextImg		= _imgFactory.createImg(type, bitmap);
			(_nextImg as DisplayObject).x		= 0;
			(_nextImg as DisplayObject).y 		= 0;
			addChild(_nextImg as DisplayObject);
			if (_currentImg)
			{
				_currentImg.hide(onPrevImageHided)
			}
			else
				onPrevImageHided();
		}
		
		public function destroy():void
		{
			if (_nextImg)
				_nextImg.destroy();
			_nextImg = null;
			_nextImgBtn.destroy();
			_nextImgBtn = null;
			_prevImgBtn.destroy();
			_prevImgBtn = null;
			if (_currentImg)
				_currentImg.destroy();
			_currentImg = null;
			_imgFactory = null;
			if (parent)
				parent.removeChild(this);
		}
		
		public function set enable(value:Boolean):void
		{
			if (_enable == value)
				return;
			_enable = value;
			_prevImgBtn.enable = value;
			_nextImgBtn.enable = value;
		}
		
		private function onPrevImageHided():void 
		{
			if (_currentImg)
				_currentImg.destroy();
			_currentImg = _nextImg;
			_currentImg.onClick.addOnce(switchIMGHandler);
			_currentImg.show();
			_nextImg = null;
			enable = true;
		}
	}

}