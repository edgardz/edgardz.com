package main.mvc.controller
{
	import flash.display.BlendMode;

	public class Loading extends Controller
	{
		public static var viewClass	: Class;
		
		public function Loading()
		{
			super();
			init( viewClass );
			
			view.alpha = 0.5;
			
			view.blendMode = BlendMode.SCREEN;
		}
	}
}