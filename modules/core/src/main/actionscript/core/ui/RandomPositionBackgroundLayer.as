package core.ui
{
	import core.WorldStep;
	import flash.display.DisplayObject;
	public class RandomPositionBackgroundLayer extends BackgroundLayer 
	{
		private var randomX:RandomRange;
		private var randomY:RandomRange;

		public function RandomPositionBackgroundLayer(speed:Number, randomX:RandomRange = null, randomY:RandomRange = null) 
		{
			super(speed);
			
			this.randomY = randomY;
			this.randomX = randomX;
		}
		
		override public function update(step:WorldStep):void 
		{
			super.update(step);
			
			var l:int = layerViews.length;
			var view:DisplayObject;
			
			for (var i:int = 0; i < l; i++)
			{
				view = layerViews[i];
				
				if (view.x + view.width < 0)
				{
					if (randomX)
						view.x = randomX.getRandom();
						
					if (randomY)
						view.y = randomY.getRandom();
				}
					
				view.x -= speed * step.dt;
				
						
				view.visible = (view.x + view.width > 0) || view.x < stage.stageWidth
			}
			
		}
	}

}