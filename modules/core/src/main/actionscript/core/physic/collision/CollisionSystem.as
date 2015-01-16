package core.physic.collision 
{
	import core.physic.geometry.CircleBody;
	import core.physic.geometry.RiggBody;
	/**
	 * ...
	 * @author Asfel
	 */
	public class CollisionSystem 
	{
		private var collisionMap:Object = { };
		private var collisionObjects:Vector.<RiggBody> = new Vector.<RiggBody>;
		
		public function CollisionSystem() 
		{
			
		}
		
		private function createCollisionMap():void
		{
			var circleToCircle:CircleToCircleCollision = new CircleToCircleCollision();
			collisionMap[circleToCircle.ident] = circleToCircle;
		}
		
		public function addBody(body:CircleBody):void 
		{
			collisionObjects.push(body);
		}
		
		public function check():void
		{
			for (var i:int = 0; i < collisionObjects.length; i++)
			{
				var riggBody:RiggBody = collisionObjects[i];
				var ident:String = riggBody.ident;
			}
		}
		

		
	}

}