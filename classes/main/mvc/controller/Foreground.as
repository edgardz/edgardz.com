package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	import com.greensock.easing.Expo;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import main.Application;
	import main.shared.Global;
	
	import org.edgardz.utils.removeChildrensFrom;
	import org.edgardz.utils.takeSnapshot;
	
	public class Foreground extends Sprite
	{
		private static var _instance		 :	Foreground;
		public static function get instance():	Foreground 
		{ if(_instance == null) _instance = new Foreground(); return _instance; }
		
		public var codeVisible	:Boolean;
		
		public var actualContainer		:Sprite;
		public var snapshotContainer	:Sprite;
		
		public function Foreground()
		{
			super();
			
			actualContainer   = new Sprite();
			snapshotContainer = new Sprite();
			
			addChild( actualContainer );
			addChild( snapshotContainer );
			
			x = Global.stage.stageWidth + 50;
		}
		
		public function showSource(e:MouseEvent=null):void
		{
			codeVisible = true;
			setSnapshotMode( true );
			TweenLite.to( this, 1, {x:Global.stage.stageWidth + 50, ease:Expo.easeInOut} );
			Application.instance.fixHeight( Background.instance );
			Background.instance.view.back.visible = true;
		}
		
		
		public function hideSource(e:MouseEvent=null):void
		{
			codeVisible = false;
			TweenLite.to( this, 1, {x:0, ease:Expo.easeInOut, onComplete:setSnapshotMode, onCompleteParams:[false]} );
			Application.instance.redistribute();
		}
		
		public function setSnapshotMode( on:Boolean ):void
		{
			removeChildrensFrom( snapshotContainer ); 
			
			if( on )
			{
				var snapshot : Bitmap = new Bitmap( new BitmapData(Global.stage.stageWidth, 1000) );
				takeSnapshot(actualContainer, snapshot, false, false, true);
				snapshotContainer.addChild( snapshot );
			}
			
			actualContainer.visible   = on ? false : true;
			snapshotContainer.visible = on ? true  : false;
		}
	}
}