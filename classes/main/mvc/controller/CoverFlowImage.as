package main.mvc.controller
{
	public class CoverFlowImage extends Controller
	{
		public static var viewClass	: Class;
		
		public function CoverFlowImage()
		{
			super();
			init( viewClass );
		}
	}
}