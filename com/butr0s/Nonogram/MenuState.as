package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class MenuState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		
		private var titleTop:FlxText;
		private var titleBottom:FlxText;
		
		override public function MenuState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			titleTop = new FlxText((FlxG.width - 200) / 2, 10, 200, 50, "NONOGRAM", 0xffffff, null, 32, "center");
			titleBottom = new FlxText((FlxG.width - 200) / 2, 60, 200, 50, "MADNESS", 0xffffff, null, 32, "center")
			
			this.add(titleTop);
			this.add(titleBottom);
			
			// "Easy" difficulty button
			this.add(new FlxButton((FlxG.width - 200) / 2, 200, new FlxSprite(null, 0, 0, false, false, 200, 50, 0xffcccccc), startGame, null, new FlxText(0, 0, 200, 50, "Easy", 0xff000000, null, 16, "center")));
			// "Hard" difficulty button
			this.add(new FlxButton((FlxG.width - 200) / 2, 300, new FlxSprite(null, 0, 0, false, false, 200, 50, 0xffcccccc), startGame, null, new FlxText(0, 0, 200, 50, "Hard", 0xff000000, null, 16, "center")));
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
