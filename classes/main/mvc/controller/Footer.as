package main.mvc.controller
{
	public class Footer extends Controller
	{
		private static var _instance		 :	Footer;
		public static function get instance():	Footer 
		{ if(_instance == null) _instance = new Footer(); return _instance; }
		public static var viewClass	: Class;
		
		public function Footer()
		{
			super();
			init( viewClass );
		}
	}
}