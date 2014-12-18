package com.chaoslabgames.game.core.physic
{
	import core.math.Point;
	
	public class PhysicWorld 
	{
		
		private var bodies:Vector.<RiggBody> = new Vector.<RiggBody>;
		
		public var _gravity:Point = new Point();
		
		public function PhysicWorld() 
		{
			
		}
		
		public function addBody(riggBody:RiggBody):void
		{
			riggBody.physicBody.gravity = _gravity;
			
			bodies.push(riggBody);
		}
		
		public function setGravity(x:Number, y:Number):void
		{
			_gravity.x = x;
			_gravity.y = y;
		}
		
		public function integrate(step:Number):void
		{
			var body:RiggBody;
			
			for (var i:int = 0; i < bodies.length; i++)
			{
				body = bodies[i];
				
				body.integrate(step);
			}
		}
		
	}

}