package com.chaoslabgames.game.core.math
{
	public class Point 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function Point(x:Number = 0, y:Number = 0) 
		{
			this.y = y;
			this.x = x;
			
		}
		
		public function toString():String 
		{
			return "[Point x=" + x + " y=" + y + "]";
		}
	}

}