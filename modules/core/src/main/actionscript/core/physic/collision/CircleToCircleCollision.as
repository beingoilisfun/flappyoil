package core.physic.collision {
	import core.math.Point;
	import core.physic.geometry.CircleBody;
	import core.physic.Shape;
	/**
	 * ...
	 * @author Asfel
	 */
	public class CircleToCircleCollision extends CollisionBase
	{
		
		public function CircleToCircleCollision() 
		{
			type1 = CircleBody.IDENT;
			type2 = CircleBody.IDENT;
			
			super();
		}
		
		override public function check(collision:CollisionInfo):void 
		{
			var body1:CircleBody = collision.body1 as CircleBody;
			var body2:CircleBody = collision.body2 as CircleBody;
			
			if (inRadius(body1.radiusSquared, body2.radiusSquared, body1.physicBody.position, body2.physicBody.position))
			{
				
			}
		}
		
		[Inline]
		public static function inRadius(radius1:Number, radius2:Number, appliationPoint:Point, interestPoint:Point):Boolean
		{
			return Point.distance2(appliationPoint, interestPoint) < radius1 + radius2;
		}
		
	}

}