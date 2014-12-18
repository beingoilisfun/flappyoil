package com.chaoslabgames.game.ui
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class GrassView extends Sprite 
	{
		private var grassPatternViews:Vector.<Bitmap> = new Vector.<Bitmap>;
		private var grassOverlayViews:Vector.<Bitmap> = new Vector.<Bitmap>;
		
		private var periodic:int = 1;
		
		public function GrassView() 
		{
			super();
			
		}
		
		public function initialize():void
		{
			var grassPattern:Bitmap = new Bitmap(new grass_pattern);
			
			grassPatternViews.push(grassPattern);
			grassPattern = new Bitmap(grassPattern.bitmapData);
			grassPatternViews.push(grassPattern);
			
			var grassOverlay:Bitmap = new Bitmap(new grass_overlay);
			
			grassOverlayViews.push(grassOverlay);
			grassOverlay = new Bitmap(grassOverlay.bitmapData);
			grassOverlayViews.push(grassOverlay);
			
			for (var i:int = 0; i < grassOverlayViews.length; i++)
			{
				grassOverlay = grassOverlayViews[i];
				grassOverlay.y = grassPattern.height - grassOverlay.height;
			}
			
			grassPatternViews[1].x = grassPatternViews[0].width;
			grassOverlayViews[1].x = grassOverlayViews[0].width;
			
			addChild(grassPatternViews[0]);
			addChild(grassPatternViews[1]);
			
			addChild(grassOverlayViews[0]);
			addChild(grassOverlayViews[1]);
		}
		
		public function update(speed:Number):void
		{
			var i:int;
			var bitmap:Bitmap;
			for (i = 0; i < grassPatternViews.length; i++)
			{
				bitmap = grassPatternViews[i];
				
				if (bitmap.x + bitmap.width < 0)
					bitmap.x = bitmap.width - speed;
						
				bitmap.x -= speed;
			}
			
			for (i = 0; i < grassOverlayViews.length; i++)
			{
				bitmap = grassOverlayViews[i];
				
				if (bitmap.x + bitmap.width < 0)
					bitmap.x = bitmap.width - speed;
					
				bitmap.x -= speed;
			}
		}
		
	}

}