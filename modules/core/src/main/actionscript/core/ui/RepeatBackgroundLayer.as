package core.ui
{
	import core.WorldStep;
	import flash.display.DisplayObject;

	public class RepeatBackgroundLayer extends BackgroundLayer 
	{
		public function RepeatBackgroundLayer(speed:int) 
		{
			super(speed);
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
					view.x = view.width-2;
					
				view.x -= speed * step.dt;
				
						
				view.visible = (view.x + view.width > 0) || view.x < stage.stageWidth
			}
		}
		
	}

}