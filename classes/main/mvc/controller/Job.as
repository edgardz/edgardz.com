package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.events.Event;
	
	import main.Application;

	public class Job extends Controller
	{
		public static var viewClass	: Class;
		
		private var window	:Window;
		
		public function Job(title:String)
		{
			super();
			init( viewClass );
			
			window = new Window(title);
			window.content 	= view;
			window.alpha 	= 0;
			window.visible 	= false;
			
			addChild( window );
			
			addEventListener(Event.ADDED, onAddedAsChild, false, 0, true);
		}
		
		private function onAddedAsChild(e:Event):void
		{
			window.alpha 	= 1;
			window.visible 	= true;
			
			Application.instance.redistribute();
			
		}
	}
}