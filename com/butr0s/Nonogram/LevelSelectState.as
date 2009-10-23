package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class LevelSelectState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/menu-background.png")] private var Background:Class;
		[Embed(source = "images/level-select-button.png")] private var ButtonBackground:Class;
		
		private var buttonBackground:FlxSprite;
		private var buttonBackgroundOn:FlxSprite;
		private var buttonText:FlxText;

		override public function LevelSelectState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			this.add(new FlxSprite(Background, 0, 0, false, false));
			
			// Set up descriptive text
			this.add(new FlxText(5, 5, 300, 50, "Select your puzzle", 0x000000, null, 24, "left"));
			
			// Set up button to return to the title screen
			this.add(new FlxButton(5, 340, new FlxSprite(null, 0, 0, false, false, 100, 20, 0xffcccccc), goToMenu, null, new FlxText(0, 0, 100, 25, "Return to title screen", 0x000000, null, 16)));
			
			// Set up level select buttons
			var buttonPlacementX:int = 10, buttonPlacementY:int = 50;
			for (var i:int = 1; i <= 30; i++)
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground, 0, 0), goToLevel, null, new FlxText(30, 0, 110, 25, "Level " + i, 0xff000000, null, 16)));
				buttonPlacementY += 27;
				if (i % 10 == 0) 
				{
					buttonPlacementX += 110;
					buttonPlacementY = 50;
				}
			}
			
		}

		override public function update():void
		{
			super.update();
			

		}
		
		private function goToLevel(number:int = 1):void
		{
			
		}
		
		private function goToMenu():void 
		{
			FlxG.switchState(MenuState);
		}
	}
}
