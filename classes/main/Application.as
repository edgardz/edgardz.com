package main
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	
	import main.mvc.controller.About;
	import main.mvc.controller.Background;
	import main.mvc.controller.Contact;
	import main.mvc.controller.Content;
	import main.mvc.controller.Footer;
	import main.mvc.controller.Foreground;
	import main.mvc.controller.GridTile;
	import main.mvc.controller.Job;
	import main.mvc.controller.Menu;
	import main.mvc.controller.Window;
	import main.mvc.view.View;
	import main.shared.Global;
	
	import org.edgardz.embed.EmbeddedSwf;

	public class Application extends EmbeddedSwf
	{
		private static var _instance		 :	Application;
		public static function get instance():	Application { return _instance; }
		
		public function Application()
		{
			_instance = this;
			embed( View.swf, onEmbed, false );
		}
		
		private function onEmbed():void
		{
			About.viewClass 		= getClassFromSwf("About");
			Background.viewClass 	= getClassFromSwf("Background");
			Contact.viewClass 		= getClassFromSwf("Contact");
			Footer.viewClass 		= getClassFromSwf("Footer");
			GridTile.viewClass 		= getClassFromSwf("GridTile");
			Job.viewClass 			= getClassFromSwf("Job");
			Menu.viewClass 			= getClassFromSwf("Menu");
			Window.viewClass 		= getClassFromSwf("Window");
			
			addChild( Background.instance );
			addChild( Foreground.instance ); 
			
			Foreground.instance.addChild( Content.instance );
			Foreground.instance.addChild( Footer.instance );
			Foreground.instance.addChild( Menu.instance );
			
			Content.instance.y = 130;
			
			Content.instance.showJobs();
			
			redistribute();
			Global.stage.addEventListener( Event.RESIZE, redistribute, false, 0, true );
		}

		public function redistribute(e:Event = null):void
		{
			
			Footer.instance.y  = Math.max(1000, Content.instance.y + Content.instance.height - 120);
			
			Content.instance.redistribute();
			Footer.instance.redistribute();
			Menu.instance.redistribute();

			fixHeight( Foreground.instance );
		}
		
		public function fixHeight( reference:DisplayObject ):void 
		{
			ExternalInterface.call("setHeight", reference.height.toString()); 
		}
	}
}