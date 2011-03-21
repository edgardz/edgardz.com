package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextFieldAutoSize;
	
	import main.Application;
	
	import org.edgardz.utils.addMouseListeners;

	public class Job extends Controller
	{
		private static var _instance		 :	Job;
		public static function get instance():	Job 
		{ if(_instance == null) _instance = new Job(); return _instance; }
		public static var viewClass	: Class;
		
		private var window		:JobWindow;
		private var jobData		:Object;
		private var coverFlow	:CoverFlow2;

		public function Job()
		{
			super();
			init( viewClass );
			
			coverFlow = new CoverFlow2( 900, 300 );
			coverFlow.x = 450;
			coverFlow.y = 150;
			
			view.container.addChild( coverFlow ); 
			view.roles.autoSize = TextFieldAutoSize.CENTER;
			addMouseListeners( view.link, onLink, onLink, onLink );
			
			
			window 			= new JobWindow();
			window.x 		= 100;
			window.alpha 	= 0;
			window.visible 	= false;
			window.content 	= view;
			
			addChild( window );
		}
		
		public function show( jobData:Object ):void 
		{
			this.jobData = jobData;
			
			window.x 		= 100;
			TweenLite.to( window, 0.3, {x:0, autoAlpha:1, ease:Expo.easeOut, delay:0.3, onComplete:Application.instance.redistribute} );
			
			window.showBackButton();
			
			coverFlow.load( jobData.images );
			
			view.client.htmlText 	= jobData.client; 
			view.plataform.htmlText = jobData.plataform;  
			view.agency.htmlText 	= jobData.agency;  
			view.company.htmlText 	= jobData.company;  
			view.roles.htmlText 	= jobData.roles;  
			
			window.title = jobData.title;
		}
		
		private function onLink(e:MouseEvent):void
		{
			switch(e.type)
			{
				case MouseEvent.ROLL_OVER:
					TweenLite.to( view.link, 0.2, {alpha:1} );
					break;
				
				case MouseEvent.ROLL_OUT:
					TweenLite.to( view.link, 0.2, {alpha:0.7} );
					break;
				
				case MouseEvent.CLICK:
					navigateToURL( new URLRequest(jobData.link), "_blank" );
					break; 
			}
		}
		
		public function hide():void
		{
			TweenLite.to( window, 0.3, {x:-100, autoAlpha:0, ease:Expo.easeOut} );
		}
	}
}