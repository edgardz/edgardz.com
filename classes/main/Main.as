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
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import main.shared.Global;
	
	import org.edgardz.embed.EmbeddedSwf;
	import org.edgardz.utils.addLoaderListeners;
	
	[SWF(width="1280", height="600", frameRate="60", backgroundColor="#ffffff")]
	
	public class Main extends EmbeddedSwf
	{
		[Embed(source="/../assets/flash/viewloader.swf", mimeType="application/octet-stream")] 
		private var Swf : Class;
		
		private var appLoader	:Loader;
		private var pctText		:String;
		private var lastPct		:int;
		
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
			
			embed( Swf, onEmbed );
		}
		
		private function onEmbed():void
		{
			ExternalInterface.call("setHeight", "100%"); 
			
			lastPct = -1;
			pctText = "";
			
			swf.loading.autoSize = TextFieldAutoSize.LEFT;  
			
			redistribute();
			Global.stage.addEventListener( Event.RESIZE, redistribute, false, 0, true );
		}
		
		private function onProgress(e:ProgressEvent):void
		{
			var pctLoaded : int = Math.abs((e.bytesLoaded / e.bytesTotal)*100);
			
			if( lastPct < pctLoaded )
			{
				lastPct = pctLoaded;
				
				pctText += 100-pctLoaded + ", ";
				
				swf.loading.text = "loading = [ " + pctText + " ];"; 
				redistribute();
			}
		}
		
		private function onComplete(e:Event):void
		{
			TweenLite.to( swf.loading, 0.4, {autoAlpha:0} );
			TweenLite.delayedCall(0.6, addChild, [appLoader]);
		}
		
		public function redistribute(e:Event = null):void
		{
			TweenLite.to( swf.loading, e==null?0:0.6, {x:(stage.stageWidth >> 1) - (swf.loading.textWidth >> 1), y:(stage.stageHeight >> 1) - (swf.loading.textHeight >> 1)} );
		}
	}
}