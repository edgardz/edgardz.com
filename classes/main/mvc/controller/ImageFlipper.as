package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.PerspectiveProjection;
	import flash.geom.Point;
	
	import org.edgardz.utils.Layer;
	import org.edgardz.utils.distance;
	import org.edgardz.utils.removeChildrensFrom;
	import org.edgardz.utils.takeSnapshot;

	public class ImageFlipper extends Controller
	{
		// 30 x 30 | 15 x 60 | 3 x 300 | 6 x 150 | 9 x 100
		// 10 x 30 | 5 x 60  | 1 x 300 | 2 x 150 | 3 x 100
		
		private var numSlicesH : int = 9;
		private var numSlicesV : int = 3;
		
		private var sliceSize  : int = 100;
		
		private var allActive : Boolean;
		
		public var imageContainer  : MovieClip;
		public var slicedContainer : MovieClip;
		
		private var relatedJob	:Job;
		
		public function ImageFlipper( relatedJob:Job )
		{
			super(); 
			
			this.relatedJob = relatedJob;

			mouseEnabled = false;
			mouseChildren = true;
			
			imageContainer 	= new MovieClip();
			slicedContainer = new MovieClip();
			
			var pp:PerspectiveProjection = new PerspectiveProjection();
				pp.projectionCenter 	 = new Point(450,150);
				pp.fieldOfView 			 = 100;
			
			slicedContainer.transform.perspectiveProjection = pp;
			
			addChild( imageContainer );
			addChild( slicedContainer );
		}
		
		public function add( img:DisplayObject ):void
		{
			img.addEventListener( MouseEvent.MOUSE_MOVE, onMouse, false, 0, true );			
			imageContainer.addChildAt( img, 0 );
		}
		
		private function onMouse(e:MouseEvent):void
		{
			sliceImage( e.currentTarget as DisplayObject );
			imageContainer.mouseEnabled = false;
			imageContainer.mouseChildren = false;	
		}
		
		private function sliceImage(img:DisplayObject):void
		{
			if( slicedContainer.numChildren == 0 )
			{
				var image : Sprite = null;
					image = new MovieClip();
				
				for ( var _x:int = 0; _x < numSlicesH; _x++ )
				{
					for ( var _y:int = 0; _y < numSlicesV; _y++ )
					{
						var slice : Bitmap = null;
							slice = new Bitmap( new BitmapData(sliceSize,sliceSize,false),PixelSnapping.NEVER );
							slice.bitmapData.draw( img, new Matrix(1,0,0,1, -_x * sliceSize, -_y * sliceSize) );
							slice.x = -sliceSize/2;
							slice.y = -sliceSize/2;
	
						var sliceClip : MovieClip = null;
							sliceClip = new MovieClip();
							sliceClip.x = sliceClip.oldX = (_x * sliceSize) + (sliceSize/2);
							sliceClip.y = sliceClip.oldY = (_y * sliceSize) + (sliceSize/2);
							sliceClip.rotationX = 0;
							sliceClip.rotationY = 0;
							sliceClip.rotationZ = 0;
							
							sliceClip.newX = randomize(sliceClip.x);
							sliceClip.newY = randomize(sliceClip.y);
							sliceClip.newRotX = randomize();
							sliceClip.newRotY = randomize();
							sliceClip.newRotZ = randomize();
							
							sliceClip.addEventListener( MouseEvent.MOUSE_OVER, moveSlice, false, 0, true );
							sliceClip.addChild( slice );
							
						image.addChild( sliceClip );
					}
				}
				
				slicedContainer.addChild( image ); 
				Layer.toBottom( img );
			}
			
		}
		
		private function moveSlice(e:MouseEvent):void
		{
			var image : MovieClip = e.currentTarget.parent;

			for( var i:int = 0; i < image.numChildren; i++ )
			{
				var slice:MovieClip = image.getChildAt(i) as MovieClip;
				
				if( slice.alpha == 1 )
				{
					if( slice == e.currentTarget )
					{
						TweenLite.to( slice, 0.5, {	rotationX:slice.newRotX,
													rotationY:slice.newRotY,
													//rotationZ:slice.newRotZ,
													z:-90, 
													x:slice.newX, 
													y:slice.newY, 
													autoAlpha:0, 
													ease:Expo.easeOut, 
													onComplete:unmoveSlice, 
													onCompleteParams:[slice]} );
					}
					else if( distance(slice, e.currentTarget) < 40 )
					{
						TweenLite.to( slice, 0.5, {	rotationX:slice.newRotX,
													rotationY:slice.newRotY,
													//rotationZ:slice.newRotZ,
													z:-90, 
													x:slice.newX, 
													y:slice.newY, 
													autoAlpha:0, 
													ease:Expo.easeOut, 
													onComplete:unmoveSlice, 
													onCompleteParams:[slice],
													delay:0.1} );
					}
					else if( distance(slice, e.currentTarget) < 80 )
					{
						TweenLite.to( slice, 0.5, {	rotationX:slice.newRotX,
													rotationY:slice.newRotY,
													//rotationZ:slice.newRotZ,
													z:-90, 
													x:slice.newX, 
													y:slice.newY, 
													autoAlpha:0, 
													ease:Expo.easeOut, 
													onComplete:unmoveSlice, 
													onCompleteParams:[slice],
													delay:0.2} );
					}
					else if( distance(slice, e.currentTarget) < 160 )
					{
						TweenLite.to( slice, 0.5, {	rotationX:slice.newRotX,
													rotationY:slice.newRotY,
													//rotationZ:slice.newRotZ,
													z:-90, 
													x:slice.newX, 
													y:slice.newY, 
													autoAlpha:0, 
													ease:Expo.easeOut, 
													onComplete:unmoveSlice, 
													onCompleteParams:[slice],
													delay:0.3} );
					}
				}
			}

		}
		
		private function unmoveSlice(slice:MovieClip):void
		{
			checkBrothersComplete(slice);
			
			if( !allActive )
			{
				TweenLite.to( slice, 0.5, {	rotationX:0,
											rotationY:0,
											rotationZ:0,
											z:0, 
											x:slice.oldX, 
											y:slice.oldY, 
											autoAlpha:1, 
											ease:Expo.easeOut,
											delay:3} );
			}
			else
			{
				var image : MovieClip = slice.parent as MovieClip;
				for( var i:int = 0; i < image.numChildren; i++ )
				{
					TweenLite.killTweensOf(image.getChildAt(i));
				}
				removeChildrensFrom( slicedContainer );
				sliceImage( imageContainer.getChildAt(imageContainer.numChildren-1) );
				allActive = false;
			}
			
		}

		private function checkBrothersComplete( slice:MovieClip ):Boolean
		{
			var result : Boolean = true;
			var image : MovieClip = slice.parent as MovieClip;
			for( var i:int = 0; i < image.numChildren; i++ )
			{
				if( image.getChildAt(i).alpha != 0 ) result = false;
			}
			
			if( result ) allActive = true;
			
			return result;
		}

		private function randomize( value:int=0 ):Number
		{
			return value + ((Math.random()*120)-60);
		}
		
	}
}