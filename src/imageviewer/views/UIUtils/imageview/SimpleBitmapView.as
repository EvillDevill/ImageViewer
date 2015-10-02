package imageviewer.views.UIUtils.imageview 
{
	import com.greensock.easing.Back;
	import com.greensock.TweenMax;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author evilMax
	 */
	public class SimpleBitmapView extends Sprite implements IImageView 
	{
		private const ANIMATION_STEP	:Number = 2;
		private const MIN_SIZE			:Number = .5;
		
		private var _borderSize		:Number;
		private var _bitmap			:Bitmap;
		private var _onClick		:Signal;
		public function SimpleBitmapView() 
		{
			super();
			_borderSize	= 10;
			_onClick = new Signal(int);
		}
		
		/* INTERFACE imageviewer.views.UIUtils.imageview.IImageView */
		
		public function create(bitmap:Bitmap):void 
		{
			_bitmap	= bitmap;
			_bitmap.smoothing = true;
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect( -_bitmap.width * .5 - _borderSize, -_bitmap.height * .5 - _borderSize, _bitmap.width + _borderSize*2, _bitmap.height + _borderSize*2);
			graphics.endFill();
			
			_bitmap.x = int( -_bitmap.width * .5);
			_bitmap.y = int( -_bitmap.height * .5);
			addChild(_bitmap);
			
			alpha = 0;
			scaleX = scaleY = MIN_SIZE;
			
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		public function destroy():void 
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			TweenMax.killTweensOf(this);
			removeChild(_bitmap);
			_bitmap = null;
			_onClick.removeAll();
			_onClick = null;
		}
		
		public function show(onComplete:Function=null):void 
		{
			var delay:Number = (1 - scaleX) / ANIMATION_STEP;
			TweenMax.to(this, delay, { alpha:1, scaleX:1, scaleY:1, ease:Back.easeOut, onComplete:onComplete } );
		}
		
		public function hide(onComplete:Function):void 
		{
			var delay:Number = (scaleX - MIN_SIZE)/ ANIMATION_STEP;
			TweenMax.to(this, delay, { alpha:0, scaleX:MIN_SIZE, scaleY:MIN_SIZE, ease:Back.easeOut, onComplete:onComplete } );
		}
		
		public function get onClick():Signal 
		{
			return _onClick;
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			_onClick.dispatch(1);
		}
		
	}

}