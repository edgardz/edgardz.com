package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import main.shared.Global;
	
	import org.edgardz.utils.addMouseListeners;

	public class Menu extends Controller
	{
		private static var _instance		 :	Menu;
		public static function get instance():	Menu 
		{ if(_instance == null) _instance = new Menu(); return _instance; }
		public static var viewClass	: Class;
		
		public function Menu()
		{
			super();
			init( viewClass );
			
			view.title.y = 60;
			
			view.title.alpha 			= 0;
			view.buttons.gallery.alpha	= 0;
			view.buttons.about.alpha	= 0;
			view.buttons.contact.alpha	= 0;
			
			TweenLite.to( view.title, 0.6, {y:46, alpha:1, ease:Expo.easeOut, delay:0.5, onComplete:view.buttons.play} ); 
			
			TweenLite.to( view.buttons.gallery, 30, {y:-4, alpha:1, ease:Expo.easeOut, useFrames:true, delay:230}); 
			TweenLite.to( view.buttons.about, 	30, {y:-4, alpha:1, ease:Expo.easeOut, useFrames:true, delay:235} ); 
			TweenLite.to( view.buttons.contact, 30, {y:-4, alpha:1, ease:Expo.easeOut, useFrames:true, delay:240} ); 

			TweenLite.delayedCall( 300, setGlow, [view.buttons.gallery, true], true );
			
			addMouseListeners( view.buttons.gallery, 	null, 		  null, 	   onButtonClick );
			addMouseListeners( view.buttons.about, 		onButtonOver, onButtonOut, onButtonClick );
			addMouseListeners( view.buttons.contact, 	onButtonOver, onButtonOut, onButtonClick );
			
			addMouseListeners( view.source, null, null, Foreground.instance.showSource );
		}
		
		private function onButtonOver(e:MouseEvent):void
		{
			setGlow( e.currentTarget as MovieClip, true );
		}
		
		private function onButtonOut(e:MouseEvent):void
		{
			
			setGlow( e.currentTarget as MovieClip, false );
		}
		
		private function onButtonClick(e:MouseEvent):void
		{
			switch(e.currentTarget)
			{
				case view.buttons.gallery:
					Content.instance.showJobs();
					break;
				
				case view.buttons.about:
					Content.instance.showAbout();
					break;
				
				case view.buttons.contact:
					Content.instance.showContact();
					break;
			}
		}
		
		private function setGlow( bt:MovieClip, yes:Boolean ):void
		{
			if( yes )
			{
				TweenMax.to( bt, 0.4, { glowFilter:{color:0xff008a, alpha:0.5, blurX:10, blurY:10} });
				TweenLite.to(bt, 0.4, {tint:0xff008a});
			}
			else
			{
				if( !bt.active )
				{
					TweenMax.to( bt, 0.4, { glowFilter:{color:0xff008a, alpha:0, blurX:10, blurY:10} });
					TweenLite.to(bt, 0.4, {tint:0x85adff});
				}
			}
		}
		
		public function updateButtons( activeContent:Array ):void
		{
			view.buttons.about.active   = activeContent[1] == 1 ? true : false;
			view.buttons.contact.active = activeContent[2] == 1 ? true : false;

			setGlow( view.buttons.about, 	true );
			setGlow( view.buttons.contact, 	true );
			setGlow( view.buttons.about, 	false );
			setGlow( view.buttons.contact, 	false );
		}
		
		public function redistribute():void
		{
			view.source.x = Global.stage.stageWidth;
		}
	}
}