package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.text.TextFieldAutoSize;
	
	import main.Application;
	import main.shared.Global;

	public class About extends Controller
	{
		private static var _instance		 :	About;
		public static function get instance():	About 
		{ if(_instance == null) _instance = new About(); return _instance; }
		public static var viewClass	: Class;
		
		private var window		:Window;
		
		public function About()
		{
			super();
			init( viewClass );
			
			view.description.autoSize = TextFieldAutoSize.CENTER;
			view.description.htmlText = Global.siteData.about;
			
			window 			= new Window();
			window.x 		= -100;
			window.y 		= 100;
			window.alpha 	= 0;
			window.visible 	= false;
			window.content 	= view;
			window.title 	= "About";
			
			addChild( window );
			
			redistribute();
		}
		
		public function show():void
		{
			window.x 		= -100;
			TweenLite.to( window, 0.3, {x:0, autoAlpha:1, ease:Expo.easeOut, delay:0.3, onComplete:Application.instance.redistribute} );
		}
		
		public function hide():void
		{
			TweenLite.to( window, 0.3, {x:-100, autoAlpha:0, ease:Expo.easeOut} );
		}
		
		public function redistribute():void
		{
			window.redistribute();
			x 	= (Global.stage.stageWidth >> 1) - (width >> 1);
		}
	}
}