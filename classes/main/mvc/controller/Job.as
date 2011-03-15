package main.mvc.controller
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import main.Application;
	
	import org.edgardz.utils.rand;

	public class Job extends Controller
	{
		public static var viewClass	: Class;
		
		private var window		:Window;
		private var imagesURL	:Array;
		private var imageFlipper:ImageFlipper;
		
		public function Job(title:String, client:String, plataform:String, agency:String, roles:String, images:Array)
		{
			super();
			init( viewClass );
			
			imageFlipper = new ImageFlipper();
			view.container.addChild( imageFlipper );

			imagesURL = images;
			loadNextImage();
			
			view.client.htmlText 	= "<i>" + client + "</i>";  
			view.plataform.htmlText = "<i>" + plataform + "</i>";  
			view.agency.htmlText 	= "<i>" + agency + "</i>";  
			view.roles.htmlText 	= "<i>" + roles + "</i>";  
			
			window 			= new Window(title);
			window.content 	= view;
			window.alpha 	= 0;
			window.visible 	= false;
			
			addChild( window );
			
			addEventListener(Event.ADDED, onAddedAsChild, false, 0, true);
		}
		
		private function onAddedAsChild(e:Event):void
		{
			window.alpha 	= 1;
			window.visible 	= true;
			
			Application.instance.redistribute();
			
		}
		
		private function loadNextImage():void
		{
			if( imagesURL.length > 0 )
			{
				var loader:Loader = new Loader();
					loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onImageLoaded, false, 0, true );
					loader.load( new URLRequest("img/" + imagesURL[0]) );
					
				imagesURL.shift();    
			}
		}
		
		private function onImageLoaded(e:Event):void
		{
			imageFlipper.add( LoaderInfo(e.currentTarget).loader );
			loadNextImage();
		}
	}
}