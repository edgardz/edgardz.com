
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
	import com.greensock.TweenLite;
	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.BlurFilterPlugin;
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.plugins.RoundPropsPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
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
	
	[SWF(width="1280", height="600", frameRate="60", backgroundColor="#efefef")]
	
	public class Main extends Sprite
	{
		private var appLoader	:Loader;
		
		private var loadPct		:Bitmap;
		
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
			
			loadPct = new Bitmap( new BitmapData(100,100,false, 0xffffff) );
			loadPct.height = 1;
			addChild( loadPct );
			
			redistribute();
			Global.stage.addEventListener( Event.RESIZE, redistribute, false, 0, true );
		}
		
		private function onProgress(e:ProgressEvent):void
		{
			TweenLite.to( loadPct, 0.6, {height:stage.stageHeight * (e.bytesLoaded / e.bytesTotal)} );
		}
		
		private function onComplete(e:Event):void
		{
			TweenLite.to( loadPct, 0.6, {height:stage.stageHeight, onComplete:addChild, onCompleteParams:[appLoader]} );
		}
		
		public function redistribute(e:Event = null):void
		{
			loadPct.width = stage.stageWidth;
		}
	}
}