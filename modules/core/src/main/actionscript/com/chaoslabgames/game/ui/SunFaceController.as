package com.chaoslabgames.game.ui
{
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Asfel
	 */
	public class SunFaceController extends Sprite 
	{
		private var sunView:sun_face;
		private var eyesAnimPart:MovieClip;
		private var mouth:MovieClip;
		private var timer:Timer;
		
		public function SunFaceController() 
		{
			super();
			
			initialize();
			
			timer = new Timer(5000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
			this.cacheAsBitmap = true;
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			if (Math.random() > 0.9)
				setMouth();
				
			if (Math.random() > 0.5)
				setEyes();
				
			timer.delay = 4000 + Math.random() * 10000;
			timer.reset();
			timer.start();
		}
		
		private function initialize():void 
		{
			sunView = new sun_face();
			
			mouth = sunView.mouth;
			eyesAnimPart = sunView.eyes.getChildByName("eyes_movig_part") as MovieClip;
			
			addChild(sunView);
			
			setMouth();
			setEyes();
		}
		
		private function setMouth():void
		{
			sunView.mouth.gotoAndStop(Math.floor(Math.random() * 3));
		}
		
		private function setEyes():void
		{
			TweenLite.to(eyesAnimPart, 1 + Math.random() * 2, { x:2 + Math.random() * 26 } );
		}
	
	}

}