package main.mvc.controller
{
	public class Background extends Controller
	{
		private static var _instance		 :	Background;
		public static function get instance():	Background 
		{ if(_instance == null) _instance = new Background(); return _instance; }
		public static var viewClass	: Class;
		
		public function Background()
		{
			super();
			init( viewClass );
		}
	}
}