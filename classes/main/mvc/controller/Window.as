package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.text.TextFieldAutoSize;
	
	import org.edgardz.utils.addMouseListeners;
	import org.edgardz.utils.removeChildrensFrom;
	
	public class Window extends Controller
	{
		public static var viewClass	: Class;
		
		public function Window()
		{
			super();
			init( viewClass );
			view.title.autoSize = TextFieldAutoSize.RIGHT;
		}
		
		public function set title( str:String ):void
		{
			view.title.text = str;
		}
		
		public function set content( windowContent:DisplayObject ):void
		{
			removeChildrensFrom( view.container );
			view.container.addChild( windowContent );
		}

		public function redistribute():void
		{
			view.frame.width  	= view.container.width  + 70;
			view.frame.height 	= view.container.height + 70;
			view.title.x 		= view.frame.width - view.title.width;
			view.shadow.width  	= view.frame.width;
			view.shadow.y 		= view.frame.height;
		}
	}
}