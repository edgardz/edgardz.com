package main.mvc.controller
{
	import flash.display.Sprite;
	
	public class Foreground extends Sprite
	{
		private static var _instance		 :	Foreground;
		public static function get instance():	Foreground 
		{ if(_instance == null) _instance = new Foreground(); return _instance; }
		
		public function Foreground()
		{
			super();
		}
	}
}