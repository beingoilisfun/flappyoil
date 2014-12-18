package com.chaoslabgames.game.core.physic
{
	import core.math.Point;
	
	public class PhysicBody 
	{
		public var linearVelocity:Point = new Point();
		public var angularVelocity:Point = new Point();
		
		public var damping_linearVelocity:Point = new Point();
		public var damping_angularVelocity:Point = new Point();
		
		public var gravity:Point;
		
		public var position:Point = new Point();
		public var lastPosition:Point = new Point();
		public var rotation:Number = 0
		
		public var shape:Shape;
		
		
		public function PhysicBody() 
		{
			
		}
		
		public function integrate(step:Number):void 
		{
			if (gravity)
			{
				linearVelocity.x += gravity.x * step;
				linearVelocity.y += gravity.y * step;
			}
			
			lastPosition.x = position.x;
			lastPosition.y = position.y;
			
			position.x += linearVelocity.x * step;
			position.y += linearVelocity.y * step;
		}
		
	}

}