package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class LevelSelectState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/menu-background.png")] private var Background:Class;
		
		private var titleTop:FlxSprite;
		private var titleBottom:FlxSprite;
		private var titleJapanese:FlxSprite;
		
		private var background:FlxSprite;

		override public function LevelSelectState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			background = new FlxSprite(Background, 0, 0, false, false);
			this.add(background);
			

		}

		override public function update():void
		{
			super.update();
			

		}
		
	}
}
