package main.mvc.controller
{
	public class Contact extends Controller
	{
		private static var _instance		 :	Contact;
		public static function get instance():	Contact 
		{ if(_instance == null) _instance = new Contact(); return _instance; }
		public static var viewClass	: Class;
		
		public function Contact()
		{
			super();
			init( viewClass );
		}
	}
}