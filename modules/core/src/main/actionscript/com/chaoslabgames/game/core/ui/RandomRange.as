package com.chaoslabgames.game.core.ui
{
	
	public class RandomRange 
	{
		public var min:Number;
		public var max:Number
		
		public function RandomRange(min:Number, max:Number) 
		{
			this.max = max;
			this.min = min;
		}
		
		public function getRandom():Number
		{
			return min + Math.random() * max;
		}
		
	}

}