package main.mvc.controller
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import main.shared.Global;
	
	import org.edgardz.utils.distribute;

	public class Gallery extends Sprite
	{
		private static var _instance		 :	Gallery;
		public static function get instance():	Gallery 
		{ if(_instance == null) _instance = new Gallery(); return _instance; }
		
		public var thumbContainer	:Sprite;
		
		public function Gallery()
		{
			super();
			
			thumbContainer 	= new Sprite();
			
			thumbContainer.y 	= 100;
			Job.instance.y 		= 100;
			
			addChild( thumbContainer );
			addChild( Job.instance );
		}
		
		public function show():void
		{
			var i		:int;
			var thumb	:Thumb;
			
			if( thumbContainer.numChildren == 0 )
			{
				for( i; i < Global.siteData.jobs.length; i++ )
				{
					thumb 	= new Thumb( Global.siteData.jobs[i].title, Global.siteData.jobs[i].thumb, i );
					thumb.addEventListener( MouseEvent.CLICK, showJob, false, 0, true );
					thumb.x = distribute( thumb, i, 3, 60 ).x;
					thumb.y = distribute( thumb, i, 3, 60 ).y;
					
					thumbContainer.addChild( thumb );
				}
			}
			else
			{
				for( i; i < thumbContainer.numChildren; i++ )
				{
					thumb = thumbContainer.getChildAt(i) as Thumb;
					thumb.show();
				}
			}
			
			Job.instance.hide();

			redistribute();
		}
		
		private function showJob(e:MouseEvent):void
		{
			hideThumbs();
			Job.instance.show( Global.siteData.jobs[e.currentTarget.id] );
		}
		
		public function hide():void
		{
			hideThumbs();
			Job.instance.hide();
		}
		
		private function hideThumbs():void
		{
			for( var i:int = 0; i < thumbContainer.numChildren; i++ )
			{
				var thumb:Thumb = thumbContainer.getChildAt(i) as Thumb;
				thumb.hide();
			}
		}
		
		public function redistribute():void
		{
			thumbContainer.x 	= (Global.stage.stageWidth >> 1) - (thumbContainer.width >> 1);
			Job.instance.x 		= (Global.stage.stageWidth >> 1) - (Job.instance.width >> 1);
		}
	}
}