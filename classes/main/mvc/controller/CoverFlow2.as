package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.PerspectiveProjection;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import org.edgardz.utils.Layer;
	import org.edgardz.utils.addMouseListeners;
	import org.edgardz.utils.distance;
	import org.edgardz.utils.removeChildrensFrom;
	import org.edgardz.utils.takeSnapshot;
	
	public class CoverFlow2 extends Sprite
	{
		private var imgWidth	:int;
		private var imgHeight	:int;
		
		private var container	:Sprite;
		private var mascara		:Bitmap;
		
		private var imageList	:Array;
		
		private var lastSnap		:Point;
		private var newSnap			:Point;
		
		private var spacingMult	:Number = 0.8;
		
		private var imagesURL	:Array;
		
		private var loading	:Loading;
		
		public function CoverFlow2( imgWidth:int, imgHeight:int )
		{
			super();

			this.imgHeight = imgHeight;
			this.imgWidth  = imgWidth;
			
			var pp:PerspectiveProjection = new PerspectiveProjection();
				pp.projectionCenter 	 = new Point(0,0);

			transform.perspectiveProjection = pp;
			
			imageList = [];
			
			container = new Sprite();
			
			container.addEventListener( MouseEvent.MOUSE_DOWN, initDrag, false, 0, true );
			
			addMouseListeners( container, onMouseOver, onMouseOut, null, false, true );
			
			loading = new Loading();
			
			addChild( loading );
			addChild( container );
			
			mascara = new Bitmap( new BitmapData(imgWidth, imgHeight) );
			mascara.x = -imgWidth / 2;
			mascara.y = -imgHeight / 2;  
			addChild( mascara );
			
			container.mask = mascara; 
			
			lastSnap 		= new Point(0,0);
			newSnap  		= new Point(0,0);
		}
		
		private function onMouseOver(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.HAND;
		}
		
		private function onMouseOut(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		public function load( urls:Array ):void
		{
			imageList = [];
			removeChildrensFrom( container );
			
			loading.visible = true;
			
			imagesURL = [];
			imagesURL = urls;
			loadNextImage();
		}
		
		private function loadNextImage():void
		{
			if( imageList.length < imagesURL.length )
			{
				var loader:Loader = new Loader();
					loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onImageLoaded, false, 0, true );
					loader.load( new URLRequest("img/" + imagesURL[imageList.length]) );
			}
		}
		
		private function onImageLoaded(e:Event):void
		{
			loading.visible = false;
			
			add( LoaderInfo(e.currentTarget).loader );
			loadNextImage();
		}
		
		public function add( img:DisplayObject ):void
		{
			img.x = -(imgWidth  >> 1);
			img.y = -(imgHeight >> 1);
			
			imageList.push( img );
			
			if( container.numChildren == 0 )
			{
				clearGrid();
			}
		}
		
		private function buildOtherImages():void
		{
			// centro direita 
			var cd:Bitmap = takeSnapshot(imageList.length == 1 ? imageList[0] : imageList[1] ); 
				cd.x = -(imgWidth  >> 1);
				cd.y = -(imgHeight >> 1);
			var cdContainer : Sprite = new Sprite();
				cdContainer.x = imgWidth * spacingMult;
				cdContainer.addChild( cd );

			// centro esquerda
			var ce:Bitmap = takeSnapshot(imageList[imageList.length-1]); 
				ce.x = -(imgWidth  >> 1);
				ce.y = -(imgHeight >> 1);
			var ceContainer : Sprite = new Sprite();
				ceContainer.x = -cdContainer.x;
				ceContainer.addChild( ce );
			
			/*
			// topo esquerda
			var te:Bitmap = takeSnapshot(imageList[0]);
				te.x = -(imgWidth  >> 1);
				te.y = -(imgHeight >> 1);
			var teContainer : Sprite = new Sprite();
				teContainer.x = ceContainer.x;
				teContainer.y = -imgHeight * 1.1;
				teContainer.addChild( te );
				
			// topo centro
			var tc:Bitmap = takeSnapshot(imageList[1]);
				tc.x = -(imgWidth  >> 1);
				tc.y = -(imgHeight >> 1);
			var tcContainer : Sprite = new Sprite();
				tcContainer.x = 0;
				tcContainer.y = -imgHeight * 1.1;
				tcContainer.addChild( tc );
				
			// topo direita
			var td:Bitmap = takeSnapshot(imageList[0]);
				td.x = -(imgWidth  >> 1);
				td.y = -(imgHeight >> 1);
			var tdContainer : Sprite = new Sprite();
				tdContainer.x = cdContainer.x;
				tdContainer.y = -imgHeight * 1.1;
				tdContainer.addChild( td );

			// baixo esquerda
			var be:Bitmap = takeSnapshot(imageList[0]);
				be.x = -(imgWidth  >> 1);
				be.y = -(imgHeight >> 1);
			var beContainer : Sprite = new Sprite();
				beContainer.x = ceContainer.x;
				beContainer.y = imgHeight * 1.1;
				beContainer.addChild( be );
				
			// baixo centro
			var bc:Bitmap = takeSnapshot(imageList[1]);
				bc.x = -(imgWidth  >> 1);
				bc.y = -(imgHeight >> 1);
			var bcContainer : Sprite = new Sprite();
				bcContainer.x = 0;
				bcContainer.y = imgHeight * 1.1;
				bcContainer.addChild( bc );
				
			// baixo direita
			var bd:Bitmap = takeSnapshot(imageList[0]);
				bd.x = -(imgWidth  >> 1);
				bd.y = -(imgHeight >> 1);
			var bdContainer : Sprite = new Sprite();
				bdContainer.x = cdContainer.x;
				bdContainer.y = imgHeight * 1.1;
				bdContainer.addChild( bd );
			*/
				
			container.addChildAt( cdContainer, 0 );
			container.addChildAt( ceContainer, 0 );
			/*
			container.addChild( teContainer );
			container.addChild( tcContainer );
			container.addChild( tdContainer );
			container.addChild( beContainer );
			container.addChild( bcContainer );
			container.addChild( bdContainer );
			*/
			updateRotations();
		}
		
		
		private function initDrag(e:MouseEvent):void
		{
			stage.addEventListener( Event.MOUSE_LEAVE, 		endDrag );
			stage.addEventListener( MouseEvent.MOUSE_UP, 	endDrag );
			stage.addEventListener( MouseEvent.MOUSE_MOVE,	onDrag );
			
			lastSnap.x = 0;
			lastSnap.y = 0;
			
			buildOtherImages();
			
			onDrag(null);
		}
		
		private function onDrag(e:MouseEvent):void
		{
			TweenLite.to( container, 0.6, {x:mouseX, y:mouseY/2, scaleX:0.8, scaleY:0.8, ease:Expo.easeOut, onUpdate:updateRotations} );
			
			if( Math.abs(mouseX) > imgWidth/2 )
			{
				endDrag(null);
			}
		}
		
		private function endDrag(e:MouseEvent):void
		{
			stage.removeEventListener( Event.MOUSE_LEAVE, 		endDrag );
			stage.removeEventListener( MouseEvent.MOUSE_UP, 	endDrag );
			stage.removeEventListener( MouseEvent.MOUSE_MOVE,	onDrag );
			
			if( container.x != 0 || container.y != 0 )
			{
				snap();
			}
			
			TweenLite.to( container, 0.6, {scaleX:1, scaleY:1, ease:Expo.easeOut} );
		}
		
		public function snap():void
		{
			newSnap.x = lastSnap.x;
			newSnap.y = lastSnap.y;
			
			container.mouseEnabled  = false;
			container.mouseChildren = false;
			
			if( Math.abs(mouseX) > imgWidth / 6 )
			{
				newSnap.x = ( mouseX > 0 ) ? lastSnap.x + (imgWidth*spacingMult) : lastSnap.x - (imgWidth*spacingMult);
				Layer.toBottom( container.getChildAt(container.numChildren-1) );
			}
			
			TweenLite.to( container, 0.6, {x: newSnap.x, y:newSnap.y, ease:Expo.easeOut, onUpdate:updateRotations, onComplete:clearGrid} );
		}
		
		private function clearGrid():void
		{
			container.mouseEnabled  = true;
			container.mouseChildren = true;
			
			if( newSnap.x < lastSnap.x )
			{
				var firstImg:DisplayObject = imageList.shift() as DisplayObject;
					imageList.push(firstImg);
			}
			else
			{
				var lastImg:DisplayObject = imageList.pop() as DisplayObject;
				imageList.unshift(lastImg);
			}
			
			removeChildrensFrom( container );

			var imgContainer : Sprite = new Sprite();
				imgContainer.addChild( imageList[0] );
			
			container.addChild( imgContainer );
			
			container.x = 0;
			container.y = 0;
			
			updateRotations();
		}
		
		private function updateRotations():void
		{
			var i:int 		= 0;
			var nChilds:int = container.numChildren;
			
			for( i = 0; i < nChilds; i++ )
			{
				var img : DisplayObject = container.getChildAt(i) as DisplayObject;
					img.rotationY =  (img.x + container.x) * 0.15;
					img.rotationX = -(img.y + container.y) * 0.1;

					//if( img.rotationY >  90 ) img.rotationY =  90;
					//if( img.rotationY < -90 ) img.rotationY = -90;
			}
		}
		
		
		public function clear():void
		{
			removeChildrensFrom( container );	
			imageList = [];
		}
	}
}