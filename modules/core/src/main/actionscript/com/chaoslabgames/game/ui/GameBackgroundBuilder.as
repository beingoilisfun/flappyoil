package com.chaoslabgames.game.ui
{
	import core.ui.Background;
	import core.ui.BackgroundLayer;
	import core.ui.RandomPositionBackgroundLayer;
	import core.ui.RandomRange;
	import core.ui.RepeatBackgroundLayer;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;

	public class GameBackgroundBuilder 
	{
		static private var background:Background;
		static private var stage:Stage;
		
		public static function create(stage:Stage):Background
		{
			GameBackgroundBuilder.stage = stage;
			
			background = new Background();
			
			creteSkyLayer();
			
			
			var sun:SunFaceController = new SunFaceController();
			background.addChild(sun);
			
			sun.x = stage.stageWidth - 200;
			sun.y = 40;
			
			//creteCloudsLayer(); 
			
			createForestLayer();
			createGrassLayer();
			createDollarAndYen();
			createTreesLayer();
			
			return background;
		}
		
		static private function creteCloudsLayer():void 
		{
			var randomX:RandomRange = new RandomRange(stage.stageWidth, stage.stageWidth * 15);
			var randomY:RandomRange = new RandomRange(0, 200);
			
			var cloudsLayer:RandomPositionBackgroundLayer = new RandomPositionBackgroundLayer(150, randomX, randomY);
			
			var cloud1:BitmapData = new cloud_1();
			var cloud2:BitmapData = new cloud_2();
			
			for (var i:int = 0; i < 2; i++)
			{
				cloudsLayer.addToLyer(new Bitmap(cloud1), randomX.getRandom(), randomY.getRandom());
				cloudsLayer.addToLyer(new Bitmap(cloud2), randomX.getRandom(), randomY.getRandom());
			}
			
			background.addLayer(cloudsLayer, 0, 0);
		}
		
		static private function creteSkyLayer():void 
		{
			var cloudsLayer:RepeatBackgroundLayer = new RepeatBackgroundLayer(5);
			
			var cloudsCompiled:Sprite = new clouds_compiled()
			cloudsLayer.addToLyer(cloudsCompiled, 0, 0)
			cloudsLayer.addToLyer(new clouds_compiled(), cloudsCompiled.width)
			
			background.addLayer(cloudsLayer, 0, 0);
		}
		
		static private function createDollarAndYen():void 
		{
			var randomX:RandomRange = new RandomRange(stage.stageWidth, stage.stageWidth * 15);
			var dollar_and_yenLayer:RandomPositionBackgroundLayer = new RandomPositionBackgroundLayer(150, randomX);
			
			var dollarAndYenPattern:BitmapData = new dollar_and_yen();
			dollar_and_yenLayer.addToLyer(new Bitmap(dollarAndYenPattern), stage.stageWidth + 500, 0)
			
			background.addLayer(dollar_and_yenLayer, 0, stage.stageHeight - 235);
		}
		
		static private function createForestLayer():void 
		{
			var forestLayer:RepeatBackgroundLayer = new RepeatBackgroundLayer(35);
			
			var forestPattern:BitmapData = new forest_pattern();
			forestLayer.addToLyer(new Bitmap(forestPattern), 0, 0)
			forestLayer.addToLyer(new Bitmap(forestPattern), forestPattern.width)
			
			background.addLayer(forestLayer, 0, stage.stageHeight - 210);
		}
		
		static private function createTreesLayer():void 
		{
			var randomX:RandomRange = new RandomRange(stage.stageWidth, stage.stageWidth * 4);
			var trees_layer:RandomPositionBackgroundLayer = new RandomPositionBackgroundLayer(150, randomX);
			
			var treePattern:BitmapData = new tree();
			for (var i:int = 0; i < 3; i++)
			{
				trees_layer.addToLyer(new Bitmap(treePattern), randomX.getRandom());
			}
			
			background.addLayer(trees_layer, 0, stage.stageHeight - 155);
		}
		
		static private function createGrassLayer():void 
		{
			var grass_layer:RepeatBackgroundLayer = new RepeatBackgroundLayer(150);
			
			var grassBackground:Bitmap = new Bitmap(new grass_pattern);
			var grassBackgroundRepeat:Bitmap = new Bitmap(grassBackground.bitmapData);
			
			var grassOverlay:Bitmap = new Bitmap(new grass_overlay);
			var grassOverlayRepeat:Bitmap = new Bitmap(grassOverlay.bitmapData);
			
			grass_layer.addToLyer(grassBackground);
			grass_layer.addToLyer(grassBackgroundRepeat, grassBackground.width);
			
			grass_layer.addToLyer(grassOverlay, 0, 34);
			grass_layer.addToLyer(grassOverlayRepeat, grassOverlay.width, 34);
			
			background.addLayer(grass_layer, 0, stage.stageHeight - 100);
		}
		
	}

}