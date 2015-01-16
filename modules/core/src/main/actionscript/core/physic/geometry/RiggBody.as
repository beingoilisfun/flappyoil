package core.physic.geometry {
	import com.greensock.TweenLite;
	import core.physic.collision.CollisionInfo;
	import core.physic.PhysicBody;
	import core.physic.Skin;

	public class RiggBody 
	{
		
		public static const IDENT:String = "RiggBody";
		
		public var ident:String
		
		public var skin:Skin;
		public var physicBody:PhysicBody = new PhysicBody();
		
		public var collisions:Vector.<CollisionInfo> = new Vector.<CollisionInfo>;
		
		public function RiggBody() 
		{
			this.ident = this['constructor'].IDENT;
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