package  
{
	import core.physic.collision.CollisionSystem;
	import core.physic.geometry.CircleBody;
	import core.physic.PhysicWorld;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Asfel
	 */
	public class Test extends Sprite 
	{
		private var collisionSystem:CollisionSystem;
		private var physicWorld:PhysicWorld;
		private var body1:CircleBody;
		private var body2:CircleBody;
		
		public function Test() 
		{
			super();
			
			physicWorld = new PhysicWorld();
			collisionSystem = new CollisionSystem();
			
			addEventListener(Event.ENTER_FRAME, onFrame);
			
			body1 = new CircleBody(50);
			body2 = new CircleBody(50);
			
			physicWorld.addBody(body1);
			physicWorld.addBody(body2);
			
			collisionSystem.addBody(body1);
			collisionSystem.addBody(body2);
		}
		
		private function onFrame(e:Event):void 
		{
			trace('on frame ', body1.physicBody.position, body2.physicBody.position, body1.radius);
			physicWorld.integrate(0.1);
			collisionSystem.check();
			
			this.graphics.clear();
			
			this.graphics.beginFill(0xFF0000, 1);
			this.graphics.lineStyle(1, 0x0);
			this.graphics.drawCircle(body1.physicBody.position.x, body1.physicBody.position.y, body1.radius);
			this.graphics.drawCircle(body2.physicBody.position.x, body2.physicBody.position.y, body2.radius);
		}
		
	}

}