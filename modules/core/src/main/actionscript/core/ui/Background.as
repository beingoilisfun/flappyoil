package core.ui
{
	import core.WorldStep;
	import flash.display.Sprite;

	public class Background extends Sprite
	{
		private var layers:Vector.<BackgroundLayer> = new Vector.<BackgroundLayer>;
		
		public function Background() 
		{
			
		}
		
		public function addLayer(layer:BackgroundLayer, layerX:Number = 0, layerY:Number = 0):void
		{
			layers.push(layer);
			
			layer.x = layerX;
			layer.y = layerY;
			
			addChild(layer);
		}
		
		public function update(step:WorldStep):void
		{
			var l:int = layers.length;
			for (var i:int = 0; i < l; i++)
			{
				layers[i].update(step);
			}
		}
		
	}

}