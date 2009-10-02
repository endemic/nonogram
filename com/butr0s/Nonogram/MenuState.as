package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class MenuState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		
		override public function MenuState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			this.add(new FlxButton(FlxG.width / 2, 10, new FlxSprite(null, 0, 0, false, false, 100, 50, 0xffcccccc), startGame, null, new FlxText(0, 0, 100, 50, "Click to play", 0xff000000, null, 16, "center")));
		}

		override public function update():void
		{
			
			super.update();
		}
		
		private function startGame():void
		{
			FlxG.switchState(PlayState);
		}
	}
}
