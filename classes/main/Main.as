
/*
* 
*
*			Full source code can be found in https://github.com/edgardz/edgardz.com
*
*
*/



package main
{
	import com.greensock.OverwriteManager;
	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.BlurFilterPlugin;
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.plugins.RoundPropsPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import main.shared.Global;
	
	import org.edgardz.utils.addLoaderListeners;
	
	[SWF(width="1280", height="600", frameRate="60", backgroundColor="#ffffff")]
	
	public class Main extends Sprite
	{
		private var appLoader	:Loader;
		
		public function Main()
		{
			stage.align 					= StageAlign.TOP_LEFT;
			stage.quality					= StageQuality.HIGH;
			stage.scaleMode					= StageScaleMode.NO_SCALE;
			stage.stageFocusRect			= false;
			stage.showDefaultContextMenu	= false;
			
			Global.stage = stage;
			
			TweenPlugin.activate( [ AutoAlphaPlugin, RoundPropsPlugin, BlurFilterPlugin, GlowFilterPlugin, ColorTransformPlugin ] );
			OverwriteManager.init();
			
			appLoader = new Loader();
			addLoaderListeners( appLoader, onProgress, onComplete, null );
			appLoader.load( new URLRequest("Application.swf") );
		}
		
		private function onProgress(e:ProgressEvent):void
		{
			
		}
		
		private function onComplete(e:Event):void
		{
			addChild( appLoader );
		}
	}
}