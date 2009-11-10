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
		
		[Embed(source = "levels/apple.png")] private var LevelOne:Class;
		[Embed(source = "levels/bomb.png")] private var LevelTwo:Class;
		[Embed(source = "levels/bottle.png")] private var LevelThree:Class;
		[Embed(source = "levels/boulder.png")] private var LevelFour:Class;
		[Embed(source = "levels/candle.png")] private var LevelFive:Class;
		[Embed(source = "levels/castle.png")] private var LevelSix:Class;
		[Embed(source = "levels/cherry.png")] private var LevelSeven:Class;
		[Embed(source = "levels/coin.png")] private var LevelEight:Class;
		[Embed(source = "levels/dog.png")] private var LevelNine:Class;
		[Embed(source = "levels/floppy-disk.png")] private var LevelTen:Class;
		[Embed(source = "levels/gameboy.png")] private var LevelEleven:Class;
		[Embed(source = "levels/heart.png")] private var LevelTwelve:Class;
		[Embed(source = "levels/house.png")] private var LevelThirteen:Class;
		[Embed(source = "levels/japan.png")] private var LevelFourteen:Class;
		[Embed(source = "levels/lock.png")] private var LevelFifteen:Class;
		[Embed(source = "levels/mario.png")] private var LevelSixteen:Class;
		[Embed(source = "levels/monster.png")] private var LevelSeventeen:Class;
		[Embed(source = "levels/mushroom.png")] private var LevelEighteen:Class;
		[Embed(source = "levels/note.png")] private var LevelNineteen:Class;
		[Embed(source = "levels/palm-tree.png")] private var LevelTwenty:Class;
		[Embed(source = "levels/pencil.png")] private var LevelTwentyOne:Class;
		[Embed(source = "levels/rabbit.png")] private var LevelTwentyTwo:Class;
		[Embed(source = "levels/shell.png")] private var LevelTwentyThree:Class;
		[Embed(source = "levels/spikes.png")] private var LevelTwentyFour:Class;
		[Embed(source = "levels/stairs.png")] private var LevelTwentyFive:Class;
		[Embed(source = "levels/stopwatch.png")] private var LevelTwentySix:Class;
		[Embed(source = "levels/sword.png")] private var LevelTwentySeven:Class;
		[Embed(source = "levels/telephone.png")] private var LevelTwentyEight:Class;
		[Embed(source = "levels/tornado.png")] private var LevelTwentyNine:Class;
		[Embed(source = "levels/trashcan.png")] private var LevelThirty:Class;
		[Embed(source = "levels/treasure-chest.png")] private var LevelThirtyOne:Class;
		[Embed(source = "levels/umbrella.png")] private var LevelThirtyTwo:Class;
		[Embed(source = "levels/watch.png")] private var LevelThirtyThree:Class;
		
		private var buttonBackground:FlxSprite;
		private var buttonBackgroundOn:FlxSprite;
		private var buttonText:FlxText;

		override public function LevelSelectState():void
		{
			// Set up level array data
			if (!FlxG.levels.length) 
			{
				FlxG.levels = new FlxArray();
				FlxG.levels.push( { } );	// Push an empty object to fill the '0' position
				FlxG.levels.push( { 'levelData':LevelOne, 'description':'Apple', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwo, 'description':'Bomb', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelThree, 'description':'Bottle', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelFour, 'description':'Boulder', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelFive, 'description':'Candle', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelSix, 'description':'Castle', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelSeven, 'description':'Cherry', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelEight, 'description':'Coin', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelNine, 'description':'Dog', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTen, 'description':'Floppy Disk', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelEleven, 'description':'Gameboy', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwelve, 'description':'Heart', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelThirteen, 'description':'House', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelFourteen, 'description':'Japan', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelFifteen, 'description':'Lock', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelSixteen, 'description':'Mario', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelSeventeen, 'description':'Monster', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelEighteen, 'description':'Mushroom', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelNineteen, 'description':'Note', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwenty, 'description':'Palm Tree', 'completed':'No' } );
				
				FlxG.levels.push( { 'levelData':LevelTwentyOne, 'description':'Pencil', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentyTwo, 'description':'Rabbit', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentyThree, 'description':'Shell', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentyFour, 'description':'Spikes', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentyFive, 'description':'Stairs', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentySix, 'description':'Stopwatch', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentySeven, 'description':'Sword', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentyEight, 'description':'Telephone', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelTwentyNine, 'description':'Tornado', 'completed':'No' } );
				FlxG.levels.push( { 'levelData':LevelThirty, 'description':'Trash Can', 'completed':'No' } );
			}
			
			FlxG.level = 1;
						
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			this.add(new FlxSprite(Background, 0, 0, false, false));
			
			// Set up descriptive text
			this.add(new FlxText(15, 25, 300, 50, "Select puzzle (hard)", 0x000000, null, 24, "left"));
			
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
			
			/*
			for (var i:int = 1; i <= 20; i++)
			{
				if (FlxG.levels[i].completed == 'Yes')
				{
					this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonCompleteBackground), goToLevel, new FlxSprite(ButtonCompleteBackgroundHover) , new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
					this.add(new FlxText(buttonPlacementX + 23, buttonPlacementY + 22, 100, 16, "Best: 2:34"));
				}
				else 
					this.add(new FlxButton(buttonPlacementX, buttonPlacementY, new FlxSprite(ButtonBackground), goToLevel, new FlxSprite(ButtonBackgroundHover), new FlxText(23, 1, 110, 25, "Level " + i, 0xff000000, null, 16)));
					
				buttonPlacementY += 35;
				if (i % 7 == 0) 
				{
					buttonPlacementX += 110;
					buttonPlacementY = 60;
				}
			}
			*/
		}

		override public function update():void
		{
			super.update();
		}
		
		private function goToLevel1():void { FlxG.level = 1; FlxG.switchState(PlayState); }
		private function goToLevel2():void { FlxG.level = 2; FlxG.switchState(PlayState); }
		private function goToLevel3():void { FlxG.level = 3; FlxG.switchState(PlayState); }
		private function goToLevel4():void { FlxG.level = 4; FlxG.switchState(PlayState); }
		private function goToLevel5():void { FlxG.level = 5; FlxG.switchState(PlayState); }
		private function goToLevel6():void { FlxG.level = 6; FlxG.switchState(PlayState); }
		private function goToLevel7():void { FlxG.level = 7; FlxG.switchState(PlayState); }
		private function goToLevel8():void { FlxG.level = 8; FlxG.switchState(PlayState); }
		private function goToLevel9():void { FlxG.level = 9; FlxG.switchState(PlayState); }
		private function goToLevel10():void { FlxG.level = 10; FlxG.switchState(PlayState); }
		private function goToLevel11():void { FlxG.level = 11; FlxG.switchState(PlayState); }
		private function goToLevel12():void { FlxG.level = 12; FlxG.switchState(PlayState); }
		private function goToLevel13():void { FlxG.level = 13; FlxG.switchState(PlayState); }
		private function goToLevel14():void { FlxG.level = 14; FlxG.switchState(PlayState); }
		private function goToLevel15():void { FlxG.level = 15; FlxG.switchState(PlayState); }
		private function goToLevel16():void { FlxG.level = 16; FlxG.switchState(PlayState); }
		private function goToLevel17():void { FlxG.level = 17; FlxG.switchState(PlayState); }
		private function goToLevel18():void { FlxG.level = 18; FlxG.switchState(PlayState); }
		private function goToLevel19():void { FlxG.level = 19; FlxG.switchState(PlayState); }
		private function goToLevel20():void { FlxG.level = 20; FlxG.switchState(PlayState); }
		
		
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