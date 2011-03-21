package main
{
	import com.brokenfunction.json.decodeJson;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import main.mvc.controller.About;
	import main.mvc.controller.Background;
	import main.mvc.controller.BackgroundSource;
	import main.mvc.controller.Contact;
	import main.mvc.controller.Content;
	import main.mvc.controller.Footer;
	import main.mvc.controller.Foreground;
	import main.mvc.controller.GridTile;
	import main.mvc.controller.Job;
	import main.mvc.controller.JobWindow;
	import main.mvc.controller.Loading;
	import main.mvc.controller.Menu;
	import main.mvc.controller.Thumb;
	import main.mvc.controller.Window;
	import main.mvc.model.SiteModel;
	import main.mvc.view.View;
	import main.shared.Global;
	
	import org.edgardz.embed.EmbeddedSwf;
	import org.edgardz.utils.rand;

	public class Application extends EmbeddedSwf
	{
		private static var _instance		 :	Application;
		public static function get instance():	Application { return _instance; }
		
		private var dataLoader	:URLLoader;
		
		public function Application()
		{ 
			_instance = this;

			SiteModel.loadSiteData( onDataLoaded );
		}
		
		private function onDataLoaded( json:String ):void
		{
			Global.siteData = decodeJson( json );
			embed( View.swf, onEmbed, false );
		}
		
		private function onEmbed():void
		{
			About.viewClass 			= getClassFromSwf("About");
			Background.viewClass 		= getClassFromSwf("Background");
			BackgroundSource.viewClass 	= getClassFromSwf("BackgroundSource");
			Contact.viewClass 			= getClassFromSwf("Contact");
			Footer.viewClass 			= getClassFromSwf("Footer");
			GridTile.viewClass 			= getClassFromSwf("GridTile");
			Job.viewClass 				= getClassFromSwf("Job");
			JobWindow.viewClass 		= getClassFromSwf("JobWindow");
			Loading.viewClass 			= getClassFromSwf("Loading");
			Menu.viewClass 				= getClassFromSwf("Menu");
			Thumb.viewClass 			= getClassFromSwf("Thumb");
			Window.viewClass 			= getClassFromSwf("Window");
			
			addChild( Background.instance );
			addChild( Foreground.instance ); 
			
			Foreground.instance.actualContainer.addChild( Content.instance );
			Foreground.instance.actualContainer.addChild( Footer.instance );
			Foreground.instance.actualContainer.addChild( Menu.instance );
			
			Content.instance.y = 130;
			
			Background.instance.initLoad();
			
			TweenLite.delayedCall( 0.5, Foreground.instance.hideSource );
			TweenLite.delayedCall( 1.5, Content.instance.showGallery );
			
			redistribute();
			Global.stage.addEventListener( Event.RESIZE, redistribute, false, 0, true );
		}

		public function redistribute(e:Event = null):void
		{
			if( !Foreground.instance.codeVisible )
			{
				Footer.instance.y  = Math.max(900, Content.instance.y + Content.instance.height - 120);
				
				Content.instance.redistribute();
				Footer.instance.redistribute();
				Menu.instance.redistribute();
	
				fixHeight( Foreground.instance );
			}
			
			Background.instance.redistribute();
		}
		
		public function fixHeight( reference:DisplayObject ):void 
		{
			ExternalInterface.call("setHeight", reference.height.toString()); 
		}
	}
}