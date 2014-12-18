package com.chaoslabgames.game.core.physic
{
	import com.greensock.TweenLite;

	public class RiggBody 
	{
		public var skin:Skin;
		public var physicBody:PhysicBody = new PhysicBody();
		
		public function RiggBody() 
		{
			
		}
		
		public function integrate(step:Number):void 
		{
			physicBody.integrate(step);
			
			if (skin)
			{
				
				skin.x = physicBody.position.x;
				skin.y = physicBody.position.y
				
				var newAngle:Number = DimensionalMath.radiansToDegrees(DimensionalMath.angle(physicBody.lastPosition, physicBody.position));
				
				TweenLite.to(skin, 0.5, { rotation:newAngle } );
			}
		}
		
	}

}