package main.mvc.controller
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
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
		
		public var jobContainer		:Sprite;
		public var gridContainer	:Sprite;		
		
		public var activeContent	:Array;
		
		public function Content()
		{
			super();
			
			activeContent = [0,0,0];
			
			jobContainer 	= new Sprite();
			gridContainer 	= new Sprite();
			
			addChild( gridContainer );
			addChild( jobContainer );
		}
		
		public function showJobs():void
		{
			if( jobContainer.numChildren == 0 )
			{
				for( var i:int = 0; i < Global.siteData.jobs.length; i++ )
				{
					var job:Job = new Job( Global.siteData.jobs[i].title );
						job.y = 650 * i;
	
					TweenLite.delayedCall( i, jobContainer.addChild, [job] );
				}
				
				jobContainer.y = 100;
			}
			
			activeContent = [1,0,0];
			
			Menu.instance.updateButtons( activeContent );
		}
		
		public function showAbout():void
		{
			activeContent = [1,1,0];
			Menu.instance.updateButtons( activeContent );
		}
		
		public function showContact():void
		{
			activeContent = [1,0,1];
			Menu.instance.updateButtons( activeContent );
		}
		
		public function redistribute():void
		{
			jobContainer.x = (Global.stage.stageWidth >> 1) - (jobContainer.width >> 1);

			var cols :int = Math.ceil( Global.stage.stageWidth / 100 );
			var rows :int = Math.ceil( jobContainer.height / 100 )+2;
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