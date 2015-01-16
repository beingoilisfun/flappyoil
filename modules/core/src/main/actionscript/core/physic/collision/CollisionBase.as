package core.physic.collision 
{
	import core.physic.Shape;
	/**
	 * ...
	 * @author Asfel
	 */
	public class CollisionBase 
	{
		public var type1:String = "defaultType";
		public var type2:String = "defaultType";
		
		public function CollisionBase() 
		{
			
		}
		
		public function get ident():String
		{
			return type1 + "_" + type2;
		}
		
		public function check(collision:CollisionInfo):void
		{
			
		}
	}

}