package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	[SWF(width = "700", height = "400", frameRate = "60", backgroundColor = "#0000")]
	/**
	 * ...
	 * @author Leonid Trofimchuk
	 */
	public class Main extends Sprite 
	{
		private var textF:InfoText;
		private var str:String;
		private var fps:FPSText; 
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			textF = new InfoText();
			addChild(textF);
			str = "x///y";
			textF.text = str;
			
			fps = new FPSText();
			fps.enable();
			addChild(fps);
			fps.y = 40;
			
			var control:ControlPad = new ControlPad();
			control.x = control.width / 1.4;
			control.y = stage.stageHeight - control.height / 1.4;
			control.addEventListener(ControlPadEvent.PAD_MOVE, control_padMove);
			addChild(control);
			
			var fireButton: FireButton = new FireButton();
			fireButton.x = stage.stageWidth - control.width * 0.6;
			fireButton.y = stage.stageHeight - fireButton.height * 1.2;
			addChild(fireButton);
			fireButton.addEventListener(FireEvent.FIRE_PROCESSED, fireButton_fireProcessed);
		}
		
		
		private function onFire():void 
		{
			textF.text = FireEvent.ON_FIRE;
		}
		
		private function offFire():void 
		{
			textF.text = FireEvent.OFF_FIRE;
		}
		
		private function fireButton_fireProcessed(e:FireEvent):void 
		{
			switch(e.title)
			{
				case FireEvent.ON_FIRE:
					onFire();
						break;
				case FireEvent.OFF_FIRE:
					offFire();
					break;
			}
		}
		
		private function control_padMove(e:ControlPadEvent):void 
		{
			str = String("x: " + e.dx.toString() + ", y: " + e.dy.toString());
			textF.text = str;
			
		}
		
		
	}
	
}