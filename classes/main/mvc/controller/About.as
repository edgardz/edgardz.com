package main.mvc.controller
{
	public class About extends Controller
	{
		private static var _instance		 :	About;
		public static function get instance():	About 
		{ if(_instance == null) _instance = new About(); return _instance; }
		public static var viewClass	: Class;
		
		public function About()
		{
			super();
			init( viewClass );
		}
	}
}