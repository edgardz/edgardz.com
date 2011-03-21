package main.mvc.controller
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	
	import main.Application;
	import main.shared.Global;
	
	import org.edgardz.utils.distribute;
	import org.edgardz.utils.rand;
	import org.edgardz.utils.removeChildrensFrom;
	
	public class Content extends Sprite
	{
		private static var _instance		 :	Content;
		public static function get instance():	Content 
		{ if(_instance == null) _instance = new Content(); return _instance; }
		
		public var gridContainer		:Sprite;
		
		private var sectionContainer	:Sprite;

		private var activeContent		:Array;
		
		public function Content()
		{
			super();
			
			activeContent = [0,0,0];

			gridContainer 		= new Sprite();
			addChild( gridContainer );
			
			sectionContainer 	= new Sprite();
			sectionContainer.addChild( Gallery.instance );
			sectionContainer.addChild( About.instance );
			sectionContainer.addChild( Contact.instance );
			
			addChild( sectionContainer );
			

			redistribute();
		}
		
		public function showGallery(e:MouseEvent=null):void
		{
			activeContent = [1,0,0];
			Gallery.instance.show();
			Menu.instance.updateButtons( activeContent );
			hideInactiveContent();
		}
		
		public function showAbout():void
		{
			activeContent = [0,1,0];
			About.instance.show();
			Menu.instance.updateButtons( activeContent );
			hideInactiveContent();
		}
		
		public function showContact():void
		{
			activeContent = [0,0,1];
			Contact.instance.show();
			Menu.instance.updateButtons( activeContent );
			hideInactiveContent();
		}
		
		private function hideInactiveContent():void
		{
			if( activeContent[0] == 0 )
			{
				Gallery.instance.hide();
			}
			if( activeContent[1] == 0 )
			{
				About.instance.hide();
			}
			if( activeContent[2] == 0 )
			{
				Contact.instance.hide();
			}
			ExternalInterface.call("scrollTo", "0"); 
			redistribute();
		}
		
		public function redistribute():void
		{
			Gallery.instance.redistribute();
			About.instance.redistribute();
			Contact.instance.redistribute();
			
			var cols :int = Math.ceil( Global.stage.stageWidth / 100 );
			var rows :int = Math.ceil( Math.max(650, sectionContainer.height) / 100 )+2;
			var total:int = cols * rows;
			removeChildrensFrom( gridContainer );
			for( var i:int = 0; i < total; i++ ) 
			{
				var tile : GridTile = new GridTile(); 
					tile.x = distribute( tile, i, cols ).x;
					tile.y = distribute( tile, i, cols ).y; 
					
				gridContainer.addChild( tile );
			}
			
			
		}
	}
}