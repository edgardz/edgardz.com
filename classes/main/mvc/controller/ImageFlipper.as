package main.mvc.controller
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import org.edgardz.utils.Layer;
	import org.edgardz.utils.distance;
	import org.edgardz.utils.removeChildrensFrom;
	import org.edgardz.utils.takeSnapshot;

	public class ImageFlipper extends Controller
	{
		// 30 x 30 | 15 x 60
		// 10 x 30 | 5 x 60
		
		private var numSlicesH : int = 30;
		private var numSlicesV : int = 10;
		private var sliceSize  : int = 30;
		
		private var allActive : Boolean;
		
		private var imageContainer 	  : MovieClip;
		private var snapshotContainer : MovieClip;
		
		public function ImageFlipper()
		{
			super(); 
			
			mouseEnabled = false;
			mouseChildren = true;
			
			imageContainer 		= new MovieClip();
			snapshotContainer 	= new MovieClip();
			
			addChild( snapshotContainer );
			addChild( imageContainer );
		}
		
		public function add( img:DisplayObject ):void
		{
			var image : Sprite = new MovieClip();
			
			for ( var _x:int = 0; _x < numSlicesH; _x++ )
			{
				for ( var _y:int = 0; _y < numSlicesV; _y++ )
				{
					
					var slice : Bitmap = new Bitmap( new BitmapData(sliceSize,sliceSize,false) );
						slice.bitmapData.draw( img, new Matrix(1,0,0,1, -_x * sliceSize, -_y * sliceSize) );
						slice.x = -sliceSize/2;
						slice.y = -sliceSize/2;

					var sliceContainer : MovieClip = new MovieClip();
						sliceContainer.x = sliceContainer.oldX = (_x * sliceSize) + (sliceSize/2);
						sliceContainer.y = sliceContainer.oldY = (_y * sliceSize) + (sliceSize/2);
						sliceContainer.newX = randomize(sliceContainer.x);
						sliceContainer.newY = randomize(sliceContainer.y);
						sliceContainer.rotationX = 0;
						sliceContainer.rotationY = 0;
						sliceContainer.rotationZ = 0;
						sliceContainer.newRotX = randomize();
						sliceContainer.newRotY = randomize();
						sliceContainer.newRotZ = randomize();
						sliceContainer.addEventListener( MouseEvent.MOUSE_MOVE, moveSlice, false, 0, true );
						sliceContainer.addChild( slice );
						
					image.addChild( sliceContainer );
				}
			}

			imageContainer.addChildAt( image, 0 ); 
			
			//checkImageIndexes();
		}
		
		private function moveSlice(e:MouseEvent):void
		{
			var image : MovieClip = e.currentTarget.parent;
			
			if( imageContainer.getChildIndex(image) == imageContainer.numChildren-1 )
			{
				for( var i:int = 0; i < image.numChildren; i++ )
				{
					var slice:MovieClip = image.getChildAt(i) as MovieClip;
					
					if( slice.alpha == 1 )
					{
						if( slice == e.currentTarget )
						{
							TweenLite.to( slice, 0.8, {	rotationX:slice.newRotX,
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
							TweenLite.to( slice, 0.8, {	rotationX:slice.newRotX,
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
							TweenLite.to( slice, 0.8, {	rotationX:slice.newRotX,
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
							TweenLite.to( slice, 0.8, {	rotationX:slice.newRotX,
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
											delay:5} );
			}
			else
			{
				allActive = false;
				Layer.toBottom( slice.parent );
				resetImage( slice.parent as MovieClip );
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
		
		private function resetImage( image:MovieClip ):void
		{
			for( var i:int = 0; i < image.numChildren; i++ )
			{
				var slice : MovieClip = image.getChildAt(i) as MovieClip;
				TweenLite.killTweensOf(slice);
				slice.x = slice.oldX;
				slice.y = slice.oldY;
				slice.z = 0;
				slice.rotationX = 0;
				slice.rotationY = 0;
				slice.rotationZ = 0;
				slice.alpha = 1;
				slice.visible = true;
			}
			
			//checkImageIndexes();
		}
		
		private function randomize( value:int=0 ):Number
		{
			return value + ((Math.random()*60)-30);
		}
		/*
		private function checkImageIndexes():void
		{
			for( var i:int = 0; i < imageContainer.numChildren; i++ )
			{
				var image : MovieClip = imageContainer.getChildAt(i) as MovieClip;
				
				if( i < imageContainer.numChildren-1 )
				{
					image.visible = false;
					
					if( i == imageContainer.numChildren-2 )
					{
						removeChildrensFrom( snapshotContainer );
						snapshotContainer.addChild( takeSnapshot(imageContainer.getChildAt(i)) );
					}
				}
				else
				{
					image.visible = true;
				}
			}
		}
		*/
	}
}