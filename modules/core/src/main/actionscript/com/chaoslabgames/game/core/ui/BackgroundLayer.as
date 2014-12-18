package com.chaoslabgames.game.core.ui {
	import core.WorldStep;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	public class BackgroundLayer extends Sprite
	{
		protected var layerViews:Vector.<DisplayObject> = new Vector.<DisplayObject>;
		
		public var speed:Number = 0;
		
		public function BackgroundLayer(speed:Number) 
		{
			this.speed = speed;
			
			this.mouseChildren = false;
			this.mouseEnabled = false;
		}
		
		public function addToLyer(displayObject:DisplayObject, startX:Number = 0, startY:Number = 0):void 
		{
			addChild(displayObject);
			layerViews.push(displayObject);
			
			displayObject.x = startX;
			displayObject.y = startY;
			
			displayObject.cacheAsBitmap = true;
			
			/*if ("cacheAsBitmapMatrix" in displayObject)
			{
				trace('cacheAsBitmapMatrix');
				displayObject['cacheAsBitmapMatrix'] = new Matrix();;
			}*/
		}
		
		public function update(step:WorldStep):void
		{
			
		}
		
	}

}