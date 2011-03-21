package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import com.greensock.easing.Linear;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import main.Application;
	import main.shared.Global;
	
	import org.edgardz.utils.addMouseListeners;

	public class Contact extends Controller
	{
		private static var _instance		 :	Contact;
		public static function get instance():	Contact 
		{ if(_instance == null) _instance = new Contact(); return _instance; }
		public static var viewClass	: Class;
		
		private var window		:Window;
		
		public function Contact()
		{
			super();
			init( viewClass );
			
			addMouseListeners( view.social.twitter,  onSocialOver, onSocialOut, onSocialClick );
			addMouseListeners( view.social.linkedin, onSocialOver, onSocialOut, onSocialClick );
			addMouseListeners( view.social.facebook, onSocialOver, onSocialOut, onSocialClick );
			
			window 			= new Window();
			window.x 		= 100;
			window.y 		= 100;
			window.alpha 	= 0;
			window.visible 	= false;
			window.content 	= view;
			window.title 	= "Contact"; 
			
			addChild( window );
			
			redistribute();
		}
		
		public function show():void
		{
			window.x 		= 100;
			TweenLite.to( window, 0.3, {x:0, autoAlpha:1, ease:Expo.easeOut, delay:0.3, onComplete:Application.instance.redistribute} );
		}
		
		public function hide():void 
		{
			TweenLite.to( window, 0.3, {x:-100, autoAlpha:0, ease:Expo.easeOut} ); 
		}
		
		private function onSocialOver(e:MouseEvent):void
		{
			for( var i:int = 0; i < view.social.numChildren; i++ )
			{
				var bt:MovieClip = view.social.getChildAt(i) as MovieClip;
				
				if( e.currentTarget == bt )
				{
					TweenLite.to( bt.pb, 0.2, {autoAlpha:0, ease:Linear.easeNone} );
				}
				else
				{
					TweenLite.to( bt.pb, 0.2, {autoAlpha:1, ease:Linear.easeNone} );
				}
			}
		}
		
		private function onSocialOut(e:MouseEvent):void
		{
			for( var i:int = 0; i < view.social.numChildren; i++ )
			{
				var bt:MovieClip = view.social.getChildAt(i) as MovieClip;
				TweenLite.to( bt.pb, 0.2, {autoAlpha:0, ease:Linear.easeNone} );
			}
		}
		
		private function onSocialClick(e:MouseEvent):void
		{
			switch(e.currentTarget)
			{
				case view.social.twitter:
					navigateToURL( new URLRequest( Global.urlTwitter ), "_blank" );
					break;
				case view.social.linkedin:
					navigateToURL( new URLRequest( Global.urlLinkedin), "_blank" );
					break;
				case view.social.facebook:
					navigateToURL( new URLRequest( Global.urlFacebook), "_blank" );
					break;
			}
		}
		
		public function redistribute():void
		{
			window.redistribute();
			x 	= (Global.stage.stageWidth >> 1) - (width >> 1);
		}
		
	}
}