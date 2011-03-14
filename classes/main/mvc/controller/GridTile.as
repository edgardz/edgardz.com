package main.mvc.controller
{
	public class GridTile extends Controller
	{
		public static var viewClass	: Class;
		
		public function GridTile()
		{
			super();
			init( viewClass );
			
			view.tile.alpha = 0.8; 
		}
	}
}