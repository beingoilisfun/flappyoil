package core.physic.geometry 
{
	import core.math.Point;
	/**
	 * ...
	 * @author Asfel
	 */
	public class CircleBody extends RiggBody 
	{
		static public const IDENT:String = "Circle";
		
		public var radius:Number = 0;
		public var radiusSquared:Number = 0;
		
		public function CircleBody(radius:Number) 
		{
			this.radius = radius;
			this.radiusSquared = radius * radius;
			
			super();
		}
		
		[Inline]
		public static function inRadius2(radius:Number, appliationPoint:Point, interestPoint:Point):Boolean
		{
			return Point.distance2(appliationPoint, interestPoint) < radius;
		}
		
		[Inline]
		public static function inRadius(radius:Number, appliationPoint:Point, interestPoint:Point):Boolean
		{
			return Point.distance(appliationPoint, interestPoint) < radius;
		}
		
		public function inRadius2(intersectPoint:Point):Boolean
		{
			return CircleBody.inRadius2(radius, this.physicBody.position, intersectPoint);
		}
		
		public function inRadius(intersectPoint:Point):Boolean
		{
			return CircleBody.inRadius(radius, this.physicBody.position, intersectPoint);
		}
		
	}

}