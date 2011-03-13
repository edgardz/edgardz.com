package main.mvc.controller
{
	import flash.display.MovieClip;
	
	public class Controller extends MovieClip
	{
		public var view		:MovieClip;
		
		public function Controller()
		{
			super();
		}
		
		protected function init( classe:Class ):void
		{
			view = new classe();
			addChild( view );
		}
	}
}