package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import com.greensock.easing.Linear;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.text.TextFieldAutoSize;
	
	import org.edgardz.utils.addMouseListeners;
	import org.edgardz.utils.removeChildrensFrom;
	
	public class Thumb extends Controller
	{
		public static var viewClass	: Class;
		
		public var id:int;
		
		private var loader :Loader;
		private var branco :Bitmap;
		
		public function Thumb( title:String, imgURL:String, id:int )
		{
			super();
			init( viewClass );
			
			this.id = id;
			
			view.y 			= 50;
			view.alpha 		= 0;
			view.visible 	= false;
			
			branco = new Bitmap( new BitmapData(10,10) );
			
			TweenLite.to( view, 0.2, {y:0, autoAlpha:1, ease:Expo.easeOut, delay:0.1*id, onComplete:loadImg} );

			function loadImg():void
			{
				loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImgLoaded, false, 0, true);
				loader.load( new URLRequest("img/" + imgURL), new LoaderContext(true) );
			}
			
			view.title.autoSize = TextFieldAutoSize.RIGHT;
			view.title.text = title;
			
			addMouseListeners(this, null, null, null);
		}
		
		private function onImgLoaded(e:Event):void
		{
			branco = new Bitmap( new BitmapData(loader.width, loader.height, false, 0xffffff) );
			branco.blendMode = BlendMode.ADD;
			
			view.container.addChild( loader );
			view.container.addChild( branco );

			view.title.x = view.frame.width - view.title.width;
			
			view.shadow.width   = view.frame.width;
			view.shadow.y 		= view.frame.height;
			
			TweenLite.to( branco, 0.2, {autoAlpha:0, ease:Linear.easeNone} );
		}
		
		public function hide():void
		{
			TweenLite.to( view, 0.2, {y:50, autoAlpha:0, ease:Expo.easeOut, delay:0.05*id} );
		}
		
		public function show():void
		{
			TweenLite.to( branco, 0.0, {autoAlpha:1} );
			TweenLite.to( branco, 0.2, {autoAlpha:0, ease:Linear.easeNone, delay:(0.05*id)+0.2} );
			TweenLite.to( view, 0.3, {y:0, autoAlpha:1, ease:Expo.easeOut, delay: 0.05*id} );
		}

	}
}