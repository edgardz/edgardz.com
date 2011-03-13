package main.mvc.controller
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
	import main.Application;
	import main.shared.Global;
	
	import org.edgardz.utils.rand;
	
	public class Content extends Sprite
	{
		private static var _instance		 :	Content;
		public static function get instance():	Content 
		{ if(_instance == null) _instance = new Content(); return _instance; }
		
		public var jobContainer		:Sprite;
		public var activeContent	:Array;
		
		public function Content()
		{
			super();
			
			activeContent = [0,0,0];
			
			jobContainer = new Sprite();
			
			addChild( jobContainer );
		}
		
		public function showJobs():void
		{
			for( var i:int = 0; i < 5; i++ )
			{
				var job:Job = new Job("Job Teste " + i);
					job.y = 650 * i;

				TweenLite.delayedCall( i, jobContainer.addChild, [job] );
			}
			
			jobContainer.y = 100;
			
			activeContent[0] = 1;
			
			Menu.instance.updateButtons( activeContent );
		}
		
		public function showAbout():void
		{
			
		}
		
		public function showContact():void
		{
			
		}
		
		public function redistribute():void
		{
			jobContainer.x = (Global.stage.stageWidth >> 1) - (jobContainer.width >> 1);
		}
	}
}