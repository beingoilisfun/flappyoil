package 
{
	import flash.geom.Vector3D;

	public class DimensionalMath 
	{
		private static var radToDeg:Number = 180 / Math.PI;
		private static var degToRad:Number = Math.PI / 180;
		
		private static var xHelper:Number;
		private static var yHelper:Number
		
		public static function radiansToDegrees(rad:Number):Number
		{
			return rad * radToDeg;
		}

		public static function degreesToRadians(deg:Number):Number
		{
			return deg * degToRad;
		}
		
		public static function getMovieVector(from:Vector3D, to:Vector3D, numberOfSteps:Number):Vector3D
		{
			var delta:Vector3D = to.subtract(from);// (from);
			delta.x /= numberOfSteps;
			delta.z /= numberOfSteps;
			
			return delta;
		}
		
		public static function inRadius(radius:Number, appliationPoint:Object, interestPoint:Object):Boolean
		{
			return distance(appliationPoint, interestPoint) < radius;
		}
		
		public static function distanceByZ(point1:Object, point2:Object):Number
		{
			xHelper = (point1.x - point2.x);
			xHelper *= xHelper;
			
			yHelper = (point1.z - point2.z);
			yHelper *= yHelper;
			
			return Math.sqrt(xHelper + yHelper);
		}
		
		public static function distance(point1:Object, point2:Object):Number
		{
			xHelper = (point1.x - point2.x);
			xHelper *= xHelper;
			
			yHelper = (point1.y - point2.y);
			yHelper *= yHelper;
			
			return Math.sqrt(xHelper + yHelper);
		}
		
		public static function angle(a:Object, b:Object):Number
		{
			xHelper = b.x - a.x;
			yHelper = b.y - a.y;

			return Math.atan2(yHelper, xHelper);
        }
		
	}

}