package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class LevelSelectState extends FlxState
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

		override public function LevelSelectState():void
		{						
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			this.add(new FlxSprite(Background, 0, 0, false, false));
			
			// Set up descriptive text
			this.add(new FlxText(31, 25, 300, 50, "Select puzzle (hard)", 0x000000, null, 24, "left"));
			
			// Set up button to return to the title screen
			this.add(new FlxButton(85, 305, new FlxSprite(null, 0, 0, false, false, 200, 25, 0xffdddddd), goToMenu, new FlxSprite(null, 0, 0, false, false, 200, 25, 0xff333333), new FlxText(0, 0, 200, 25, "Back to main menu", 0xff333333, null, 16, "center"), new FlxText(0, 0, 200, 25, "Back to main menu", 0xffcccccc, null, 16, "center")));
			
			// Set up level select buttons
			var buttonPlacementX:int = 10, buttonPlacementY:int = 60;
			
			// Level 1
			var i:int = 22;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel1, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 1", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel1, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 1", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 2
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel2, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 2", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel2, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 2", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 3
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel3, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 3", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel3, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 3", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 4
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel4, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 4", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel4, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 4", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 5
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel5, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 5", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel5, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 5", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 6
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel6, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 6", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel6, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 6", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 7
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel7, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 7", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel7, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 7", 0xff000000, null, 16)));
			
			buttonPlacementY = 60;		// Reset to top
			buttonPlacementX += 110;
			
			// Level 8
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel8, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 8", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel8, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 8", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 9
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel9, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 9", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel9, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 9", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 10
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel10, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 10", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel10, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 10", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 11
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel11, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level 11", 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel11, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level 11", 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 12
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel12, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel12, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 13
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel13, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel13, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 14
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel14, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel14, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY = 60;		// Reset to top
			buttonPlacementX += 110;
			
			// Level 15
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel15, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel15, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 16
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel16, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel16, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 17
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel17, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel17, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 18
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel18, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel18, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 19
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel19, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel19, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 20
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel20, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel20, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;
			
			// Level 21
			i++;
			if (FlxG.levels[i].completed == 'Yes')
			{
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel21, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
				this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: " + FlxG.levels[i].bestTime));
			}
			else 
				this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel21, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + (i - 21), 0xff000000, null, 16)));
			
			buttonPlacementY += 35;

		}

		override public function update():void
		{
			super.update();
		}
		
		private function goToLevel1():void { FlxG.level = 22; FlxG.switchState(PlayState); }
		private function goToLevel2():void { FlxG.level = 23; FlxG.switchState(PlayState); }
		private function goToLevel3():void { FlxG.level = 24; FlxG.switchState(PlayState); }
		private function goToLevel4():void { FlxG.level = 25; FlxG.switchState(PlayState); }
		private function goToLevel5():void { FlxG.level = 26; FlxG.switchState(PlayState); }
		private function goToLevel6():void { FlxG.level = 27; FlxG.switchState(PlayState); }
		private function goToLevel7():void { FlxG.level = 28; FlxG.switchState(PlayState); }
		private function goToLevel8():void { FlxG.level = 29; FlxG.switchState(PlayState); }
		private function goToLevel9():void { FlxG.level = 30; FlxG.switchState(PlayState); }
		private function goToLevel10():void { FlxG.level = 31; FlxG.switchState(PlayState); }
		private function goToLevel11():void { FlxG.level = 32; FlxG.switchState(PlayState); }
		private function goToLevel12():void { FlxG.level = 33; FlxG.switchState(PlayState); }
		private function goToLevel13():void { FlxG.level = 34; FlxG.switchState(PlayState); }
		private function goToLevel14():void { FlxG.level = 35; FlxG.switchState(PlayState); }
		private function goToLevel15():void { FlxG.level = 36; FlxG.switchState(PlayState); }
		private function goToLevel16():void { FlxG.level = 37; FlxG.switchState(PlayState); }
		private function goToLevel17():void { FlxG.level = 38; FlxG.switchState(PlayState); }
		private function goToLevel18():void { FlxG.level = 39; FlxG.switchState(PlayState); }
		private function goToLevel19():void { FlxG.level = 40; FlxG.switchState(PlayState); }
		private function goToLevel20():void { FlxG.level = 41; FlxG.switchState(PlayState); }
		private function goToLevel21():void { FlxG.level = 42; FlxG.switchState(PlayState); }
		
		
		private function goToLevel(number:int = 1):void
		{
			FlxG.switchState(PlayState);
		}
		
		private function goToMenu():void 
		{
			FlxG.switchState(MenuState);
		}
	}
}