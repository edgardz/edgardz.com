package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import main.shared.Global;
	
	import org.edgardz.utils.addMouseListeners;

	public class Footer extends Controller
	{
		private static var _instance		 :	Footer;
		public static function get instance():	Footer 
		{ if(_instance == null) _instance = new Footer(); return _instance; }
		public static var viewClass	: Class;
		
		public function Footer()
		{
			super();
			init( viewClass );
			
			addMouseListeners( view.social.twitter,  onSocialOver, onSocialOut, onSocialClick );
			addMouseListeners( view.social.linkedin, onSocialOver, onSocialOut, onSocialClick );
			addMouseListeners( view.social.facebook, onSocialOver, onSocialOut, onSocialClick );
			
			onSocialOut(null);
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
			view.social.x = Global.stage.stageWidth >> 1;
		}
	}
}