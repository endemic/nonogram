package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class MenuState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/menu-background.png")] private var Background:Class;
		
		private var titleTop:FlxText;
		private var shadowTop:FlxText;
		private var titleBottom:FlxText;
		private var shadowBottom:FlxText;
		
		private var background:FlxSprite;
		
		override public function MenuState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			background = new FlxSprite(Background, 0, 0, false, false);
			this.add(background);
			
			shadowTop = new FlxText((FlxG.width - 200) / 2, 10, 200, 50, "NONOGRAM", 0x000000, null, 33, "center");
			titleTop = new FlxText((FlxG.width - 200) / 2, 10, 200, 50, "NONOGRAM", 0xffffff, null, 32, "center");
			shadowBottom = new FlxText((FlxG.width - 200) / 2, 60, 200, 50, "MADNESS", 0x000000, null, 33, "center")
			titleBottom = new FlxText((FlxG.width - 200) / 2, 60, 200, 50, "MADNESS", 0xffffff, null, 32, "center")
			
			this.add(shadowTop);
			this.add(shadowBottom);
			this.add(titleTop);
			this.add(titleBottom);
			
			// "Easy" difficulty button
			this.add(new FlxButton((FlxG.width - 200) / 2, 200, new FlxSprite(null, 0, 0, false, false, 200, 50, 0x00ffffff), startGame, null, new FlxText(0, 0, 200, 50, "Easy", 0xff000000, null, 16, "center"), new FlxText(0, 0, 200, 50, "Easy", 0xcccccc, null, 16, "center")));
			// "Hard" difficulty button
			this.add(new FlxButton((FlxG.width - 200) / 2, 300, new FlxSprite(null, 0, 0, false, false, 200, 50, 0x00ffffff), startGame, null, new FlxText(0, 0, 200, 50, "Hard", 0xff000000, null, 16, "center"), new FlxText(0, 0, 200, 50, "Hard", 0xcccccc, null, 16, "center")));
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
