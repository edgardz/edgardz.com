package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
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

			addMouseListeners( view.buttons.gallery, 	null, 		  null, 	   onButtonClick );
			addMouseListeners( view.buttons.about, 		onButtonOver, onButtonOut, onButtonClick );
			addMouseListeners( view.buttons.contact, 	onButtonOver, onButtonOut, onButtonClick );
		}
		
		private function onButtonOver(e:MouseEvent):void
		{
			
		}
		
		private function onButtonOut(e:MouseEvent):void
		{
			
		}
		
		private function onButtonClick(e:MouseEvent):void
		{
			switch(e.currentTarget)
			{
				case view.buttons.about:
					Content.instance.showAbout();
					break;
				
				case view.buttons.contact:
					Content.instance.showContact();
					break;
			}
		}
		
		public function updateButtons( activeContent:Array ):void
		{
			
		}
		
		public function redistribute():void
		{
			view.source.x = Global.stage.stageWidth;
		}
	}
}