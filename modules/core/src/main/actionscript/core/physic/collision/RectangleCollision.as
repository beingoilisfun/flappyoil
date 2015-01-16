package core.physic.collision {
	/**
	 * ...
	 * @author Asfel
	 */
	public class RectangleCollision 
	{
		
		public function RectangleCollision() 
		{
			
		}
		
		public function check(body1:RiggBody, body2:RiggBody):void
		{
			var shape1:RectangleShape = body1.physicBody.shape;
			var shape2:RectangleShape = body2.physicBody.shape;
			
			
		}
		
	}

}