package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	import main.shared.Global;
	
	import org.edgardz.utils.Layer;
	import org.edgardz.utils.addMouseListeners;

	public class Background extends Controller
	{
		private static var _instance		 :	Background;
		public static function get instance():	Background 
		{ if(_instance == null) _instance = new Background(); return _instance; }
		public static var viewClass	: Class;
		
		private var classesURL	:Array = 
		[	
			"../classes/main/Main.as",
			"../classes/main/Application.as",
			
			"../classes/main/shared/Global.as",
			
			"../classes/main/mvc/controller/About.as",
			"../classes/main/mvc/controller/Background.as",
			"../classes/main/mvc/controller/BackgroundSource.as",
			"../classes/main/mvc/controller/Contact.as",
			"../classes/main/mvc/controller/Content.as",
			"../classes/main/mvc/controller/Controller.as",
			"../classes/main/mvc/controller/CoverFlow2.as",
			"../classes/main/mvc/controller/Footer.as",
			"../classes/main/mvc/controller/Foreground.as",
			"../classes/main/mvc/controller/Gallery.as",
			"../classes/main/mvc/controller/GridTile.as",
			"../classes/main/mvc/controller/ImageFlipper.as",
			"../classes/main/mvc/controller/Job.as",
			"../classes/main/mvc/controller/JobWindow.as",
			"../classes/main/mvc/controller/Loading.as",
			"../classes/main/mvc/controller/Menu.as",
			"../classes/main/mvc/controller/Thumb.as",
			"../classes/main/mvc/controller/Window.as",

			"../classes/main/mvc/model/SiteModel.as",
			
			"../classes/main/mvc/view/View.as" 
		];
		
		private var loader : URLLoader;
		
		private var dict   :Dictionary;
		
		public function Background()
		{
			super();
			init( viewClass );
			
			dict = new Dictionary();

			addMouseListeners( view.back, null, null, Foreground.instance.hideSource );
			view.back.visible = false;
			
			view.y = Global.stage.stageHeight;
		}
		
		public function initLoad():void
		{
			loadNextSource();
		}
		
		private function loadNextSource():void
		{
			if( classesURL.length > 0 )
			{
				var loader:URLLoader = new URLLoader();
					loader.addEventListener( Event.COMPLETE, onComplete, false, 0, true );
					loader.load( new URLRequest(classesURL[0]) );
				
				var source : BackgroundSource = new BackgroundSource();
					source.y = (view.numChildren == 1) ? 0 : view.height;
					
				view.addChild( source );
				
				dict[loader] = source;
				
				classesURL.shift();
			}
			
			Layer.toTop( view.back );
		}
		
		private function onComplete(e:Event):void
		{
			dict[e.currentTarget].text = e.currentTarget.data;
			loadNextSource(); 
			
			TweenLite.to( view, 1, {y:0, ease:Expo.easeOut, delay:0.2} );
		}
		
		public function redistribute():void
		{
			view.back.x = Global.stage.stageWidth - 25;
		}
	}
}