package main.mvc.controller
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextFieldAutoSize;
	
	import org.edgardz.utils.removeChildrensFrom;

	public class Window extends Controller
	{
		public static var viewClass	: Class;

		public function Window( title:String )
		{
			super();
			init( viewClass );
			view.title.autoSize = TextFieldAutoSize.RIGHT;
			view.title.text = title;
		}
		
		public function set content( windowContent:DisplayObject ):void
		{
			removeChildrensFrom( view.container );
			view.container.addChild( windowContent );
			
			view.frame.width  = windowContent.width  + 70;
			view.frame.height = windowContent.height + 70;
			
			view.shadow.width  = view.frame.width;
			
			view.shadow.y = view.frame.height;
		}
	}
}