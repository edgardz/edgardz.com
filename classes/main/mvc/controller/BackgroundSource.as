package main.mvc.controller
{
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import org.edgardz.utils.addMouseListeners;
	import org.edgardz.utils.removeChildrensFrom;
	import org.edgardz.utils.takeSnapshot;

	public class BackgroundSource extends Controller
	{
		public static var viewClass	: Class;
		
		private var source : TextField;
		
		public function BackgroundSource()
		{
			super();
			init( viewClass );
			
			source = view.source as TextField;
			source.autoSize = TextFieldAutoSize.CENTER;
			
			view.removeChild( source );
			
			addMouseListeners( view, null, null, gotogit, false );
		}
		
		private function gotogit(e:MouseEvent):void
		{
			navigateToURL( new URLRequest("https://github.com/edgardz/edgardz.com"), "_blank" );
		}
		
		public function set text(value:String):void 
		{
			source.text = value.split(String.fromCharCode(13)).join('');  
			source.appendText( "\n\n\n/* - - - - - > Full source code can be found in https://github.com/edgardz/edgardz.com < - - - - - */\n\n\n" );
			
			removeChildrensFrom( view );
			view.addChild( takeSnapshot(source, null, false, false, false) );
		}
	}
}