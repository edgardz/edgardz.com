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

	public class JobWindow extends Controller
	{
		public static var viewClass	: Class;

		public function JobWindow()
		{
			super();
			init( viewClass );
			view.title.autoSize = TextFieldAutoSize.RIGHT;
			
			addMouseListeners( view.backButton, null, null, onBackClicked );
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
		
		public function showBackButton():void
		{
			view.backButton.x 		= 100;
			view.backButton.alpha 	= 0;
			view.backButton.visible = false;
			TweenLite.to( view.backButton, 0.3, {x:0, autoAlpha:1, ease:Expo.easeOut, delay:0.6} );
			ExternalInterface.call("scrollTo", "70"); 
		}
		
		private function onBackClicked(e:MouseEvent):void
		{
			Gallery.instance.show();
			ExternalInterface.call("scrollToPrev");
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