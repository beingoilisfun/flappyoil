package core.physic 
{
	/**
	 * ...
	 * @author Asfel
	 */
	public class RectangleShape extends Shape 
	{
		private var width:int;
		private var height:int;
		
		public function RectangleShape(width:int, height:int) 
		{
			
			this.height = height;
			this.width = width;
			
			super();
		}
		
	}

}