package com.chaoslabgames.android  {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

public class AndroidMain extends Sprite {
		
		public function AndroidMain()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			addChild(new Main())
		}
		
	}
}
