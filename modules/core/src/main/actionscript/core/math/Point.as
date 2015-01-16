package core.math
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
		
		[Inline]
		public static function distance2(point1:Point, point2:Point):Number
		{
			var xHelper:Number = (point1.x - point2.x);
			xHelper *= xHelper;
			
			var yHelper:Number = (point1.y - point2.y);
			yHelper *= yHelper;
			
			return xHelper + yHelper;
		}
		
		
		[Inline]
		public static function distance(point1:Point, point2:Point):Number
		{
			var xHelper:Number = (point1.x - point2.x);
			xHelper *= xHelper;
			
			var yHelper:Number = (point1.y - point2.y);
			yHelper *= yHelper;
			
			return Math.sqrt(xHelper + yHelper);
		}
		
		public function distance(point:Point):Number
		{
			return Point.distance(this, point);
		}
		
		public function distance2(point:Point):Number
		{
			return Point.distance2(this, point);
		}
		
		public function toString():String 
		{
			return "[Point x=" + x + " y=" + y + "]";
		}
	}

}