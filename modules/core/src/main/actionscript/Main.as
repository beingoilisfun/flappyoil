package 
{
	import core.physic.PhysicWorld;
	import core.physic.RiggBody;
	import core.physic.Skin;
	import core.ui.Background;
	import core.WorldStep;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import game.ui.GameBackgroundBuilder;
	
	/**
	 * ...
	 * @author Asfel
	 */
	public class Main extends Sprite 
	{
		private var physicWorld:PhysicWorld;
		private var body:RiggBody;
		private var background:Background;
		
		public function Main():void 
		{
			if (this.stage) {
				onAddedToStage(null);
			} else {
				this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}

		}

		private function onAddedToStage(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);

			// touch or gesture?
			//Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;

			background = GameBackgroundBuilder.create(stage);

			addChild(background);

			physicWorld = new PhysicWorld();
			physicWorld.setGravity(0, 1000);


			body = new RiggBody();
			body.skin = new Skin();
			var bitmapOil:Bitmap = new Bitmap(new oil);
			bitmapOil.scaleX = bitmapOil.scaleY = 0.5;
			bitmapOil.x -= 80 * 0.5
			bitmapOil.y -= 45 * 0.5
			body.skin.addChild(bitmapOil);

			physicWorld.addBody(body);

			addChild(body.skin);

			body.physicBody.position.y = 200;
			body.physicBody.position.x = (stage.stageWidth - 25)/2;
			//body.physicBody.linearVelocity.x = 150;

			//addEventListener(Event.ENTER_FRAME, onFrame);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onkeyDown);


			var timer:Timer = new Timer(1000 / 60);
			timer.addEventListener(TimerEvent.TIMER, onFrame);
			timer.start();
		}
		
		private function onkeyDown(e:MouseEvent):void 
		{
			body.physicBody.linearVelocity.y = -400;
		}
		
		private var worldStep:WorldStep = new WorldStep();
		
		private function onFrame(e:Event):void 
		{

			worldStep.dt = 0.035;
			worldStep.time += worldStep.dt;
			
			physicWorld.integrate(worldStep.dt);
			
			if (body.physicBody.position.x > stage.stageWidth)
				body.physicBody.position.x = -25;
				
			if (body.physicBody.position.y > stage.stageHeight)
				body.physicBody.position.y = -25;
				
			background.update(worldStep);
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}