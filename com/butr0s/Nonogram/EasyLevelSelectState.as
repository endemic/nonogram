package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class EasyLevelSelectState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/menu-background.png")] private var Background:Class;
		[Embed(source = "images/level-select-button.png")] private var ButtonBackground:Class;
		[Embed(source = "images/level-select-complete-button.png")] private var ButtonCompleteBackground:Class;
		[Embed(source = "images/level-select-button-hover.png")] private var ButtonBackgroundHover:Class;
		[Embed(source = "images/level-select-complete-button-hover.png")] private var ButtonCompleteBackgroundHover:Class;

		private var buttonBackground:FlxSprite;
		private var buttonBackgroundOn:FlxSprite;
		private var buttonText:FlxText;

		override public function EasyLevelSelectState():void
		{				
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			this.add(new FlxSprite(Background, 0, 0, false, false));
			
			// Set up descriptive text
			this.add(new FlxText(15, 25, 300, 50, "Select puzzle (easy)", 0x000000, null, 24, "left"));
			
			// Set up button to return to the title screen
			this.add(new FlxButton(5, 315, new FlxSprite(null, 0, 0, false, false, 200, 25, 0x00ffffff), goToMenu, null, new FlxText(0, 0, 200, 25, "Back to main menu", 0x000000, null, 16), new FlxText(0, 0, 200, 25, "Back to main menu", 0xcccccc, null, 16)));
			
			// Set up level select buttons
			var buttonPlacementX:int = 10, buttonPlacementY:int = 60;
			
			// Level 1
			if (FlxG.levels[1].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel1, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 1", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[1].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel1, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 1", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 2
			if (FlxG.levels[2].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel2, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 2", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[2].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel2, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 2", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 3
			if (FlxG.levels[3].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel3, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 3", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[3].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel3, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 3", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 4
			if (FlxG.levels[4].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel4, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 4", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[4].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel4, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 4", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 5
			if (FlxG.levels[5].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel5, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 5", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[5].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel5, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 5", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 6
			if (FlxG.levels[6].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel6, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 6", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[6].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel6, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 6", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 7
			if (FlxG.levels[7].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel7, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 7", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[7].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel7, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 7", 0xff000000, null, 16)));
			
			buttonPlacementY = 60;		// Reset to top
			buttonPlacementX += 110;
			
			// Level 8
			if (FlxG.levels[8].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel8, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 8", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[8].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel8, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 8", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 9
			if (FlxG.levels[9].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel9, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 9", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[9].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel9, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 9", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 10
			if (FlxG.levels[10].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel10, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 10", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[10].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel10, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 10", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 11
			if (FlxG.levels[11].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel11, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 11", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[11].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel11, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 11", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 12
			var i:uint = 12;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel12, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel12, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 13
			i = 13;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel13, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel13, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 14
			i = 14;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel14, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel14, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY = 60;		// Reset to top
			buttonPlacementX += 110;
			
			// Level 15
			i = 15;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel15, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel15, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 16
			i = 16;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel16, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel16, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 17
			i = 17;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel17, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel17, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 18
			i = 18;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel18, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel18, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 19
			i = 19;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel19, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel19, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 20
			i = 20;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel20, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel20, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 21
			i = 21;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel21, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel21, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
		}

		override public function update():void
		{
			super.update();
		}
		
		private function goToLevel1():void { FlxG.level = 1; FlxG.switchState(EasyPlayState); }
		private function goToLevel2():void { FlxG.level = 2; FlxG.switchState(EasyPlayState); }
		private function goToLevel3():void { FlxG.level = 3; FlxG.switchState(EasyPlayState); }
		private function goToLevel4():void { FlxG.level = 4; FlxG.switchState(EasyPlayState); }
		private function goToLevel5():void { FlxG.level = 5; FlxG.switchState(EasyPlayState); }
		private function goToLevel6():void { FlxG.level = 6; FlxG.switchState(EasyPlayState); }
		private function goToLevel7():void { FlxG.level = 7; FlxG.switchState(EasyPlayState); }
		private function goToLevel8():void { FlxG.level = 8; FlxG.switchState(EasyPlayState); }
		private function goToLevel9():void { FlxG.level = 9; FlxG.switchState(EasyPlayState); }
		private function goToLevel10():void { FlxG.level = 10; FlxG.switchState(EasyPlayState); }
		private function goToLevel11():void { FlxG.level = 11; FlxG.switchState(EasyPlayState); }
		private function goToLevel12():void { FlxG.level = 12; FlxG.switchState(EasyPlayState); }
		private function goToLevel13():void { FlxG.level = 13; FlxG.switchState(EasyPlayState); }
		private function goToLevel14():void { FlxG.level = 14; FlxG.switchState(EasyPlayState); }
		private function goToLevel15():void { FlxG.level = 15; FlxG.switchState(EasyPlayState); }
		private function goToLevel16():void { FlxG.level = 16; FlxG.switchState(EasyPlayState); }
		private function goToLevel17():void { FlxG.level = 17; FlxG.switchState(EasyPlayState); }
		private function goToLevel18():void { FlxG.level = 18; FlxG.switchState(EasyPlayState); }
		private function goToLevel19():void { FlxG.level = 19; FlxG.switchState(EasyPlayState); }
		private function goToLevel20():void { FlxG.level = 20; FlxG.switchState(EasyPlayState); }
		private function goToLevel21():void { FlxG.level = 21; FlxG.switchState(EasyPlayState); }
		
		
		private function goToLevel(number:int = 1):void
		{
			FlxG.switchState(EasyPlayState);
		}
		
		private function goToMenu():void 
		{
			FlxG.switchState(MenuState);
		}
	}
}