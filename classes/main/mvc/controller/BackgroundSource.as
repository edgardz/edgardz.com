package main.mvc.controller
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
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
		}
		
		public function set text(value:String):void
		{
			source.text = value.split(String.fromCharCode(13)).join('');
			source.appendText( "\n\n\n- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -\n\n\n" );
			
			removeChildrensFrom( view );
			view.addChild( takeSnapshot(source, null, false, false, false) );
		}
	}
}