package main.mvc.controller
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.Security;

	public class Background extends Controller
	{
		private static var _instance		 :	Background;
		public static function get instance():	Background 
		{ if(_instance == null) _instance = new Background(); return _instance; }
		public static var viewClass	: Class;
		
		private var loader : Loader;
		
		public function Background()
		{
			super();
			init( viewClass );
			
			Security.loadPolicyFile("https://github.com/edgardz/edgardz.com/raw/master/crossdomain.xml");
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onComplete );
			loader.load( new URLRequest("https://github.com/edgardz/edgardz.com/raw/master/classes/main/Main.as"), new LoaderContext(true) );
		}
		
		private function onComplete(e:Event):void
		{
			trace( e.currentTarget.content );
		}
	}
}