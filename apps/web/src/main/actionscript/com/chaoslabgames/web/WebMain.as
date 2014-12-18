package com.chaoslabgames.web  {

import com.chaoslabgames.game.Game;

import flash.display.Sprite;
	

	public class WebMain extends Sprite {
		
		public function WebMain()
		{
			addChild(new Game("Hello WEB!"))
		}
		
	}
}
