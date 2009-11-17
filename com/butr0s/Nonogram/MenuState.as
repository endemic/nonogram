package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class MenuState extends FlxState
	{
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/menu-background.png")] private var Background:Class;
		[Embed(source = "images/title-top.png")] private var TitleTop:Class;
		[Embed(source = "images/title-bottom.png")] private var TitleBottom:Class;
		[Embed(source = "images/title-japanese.png")] private var TitleJapanese:Class;
		
		private var titleTop:FlxSprite;
		private var titleBottom:FlxSprite;
		private var titleJapanese:FlxSprite;
		
		private var background:FlxSprite;
		
		private var ok1:Boolean = false;
		private var ok2:Boolean = false;
		private var ok3:Boolean = false;
		static private var playedAnimation:Boolean = false;
		
		[Embed(source = "levels/easy/bomb.png")] private var LevelOneEasy:Class;
		[Embed(source = "levels/easy/heart.png")] private var LevelTwoEasy:Class;
		[Embed(source = "levels/easy/trash-can.png")] private var LevelThreeEasy:Class;
		[Embed(source = "levels/easy/pill.png")] private var LevelFourEasy:Class;
		[Embed(source = "levels/easy/padlock.png")] private var LevelFiveEasy:Class;
		[Embed(source = "levels/easy/smiley.png")] private var LevelSixEasy:Class;
		[Embed(source = "levels/easy/clock.png")] private var LevelSevenEasy:Class;
		[Embed(source = "levels/easy/tv.png")] private var LevelEightEasy:Class;
		[Embed(source = "levels/easy/insect.png")] private var LevelNineEasy:Class;
		[Embed(source = "levels/easy/ankh.png")] private var LevelTenEasy:Class;
		[Embed(source = "levels/easy/note.png")] private var LevelElevenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelTwelveEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelThirteenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelFourteenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelFifteenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelSixteenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelSeventeenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelEighteenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelNineteenEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelTwentyEasy:Class;
		[Embed(source = "levels/easy/cube.png")] private var LevelTwentyOneEasy:Class;
		
		[Embed(source = "levels/hard/apple.png")] private var LevelOneHard:Class;
		[Embed(source = "levels/hard/bomb.png")] private var LevelTwoHard:Class;
		[Embed(source = "levels/hard/bottle.png")] private var LevelThreeHard:Class;
		[Embed(source = "levels/hard/boulder.png")] private var LevelFourHard:Class;
		[Embed(source = "levels/hard/candle.png")] private var LevelFiveHard:Class;
		[Embed(source = "levels/hard/castle.png")] private var LevelSixHard:Class;
		[Embed(source = "levels/hard/cherry.png")] private var LevelSevenHard:Class;
		[Embed(source = "levels/hard/coin.png")] private var LevelEightHard:Class;
		[Embed(source = "levels/hard/dog.png")] private var LevelNineHard:Class;
		[Embed(source = "levels/hard/floppy-disk.png")] private var LevelTenHard:Class;
		[Embed(source = "levels/hard/gameboy.png")] private var LevelElevenHard:Class;
		[Embed(source = "levels/hard/heart.png")] private var LevelTwelveHard:Class;
		[Embed(source = "levels/hard/house.png")] private var LevelThirteenHard:Class;
		[Embed(source = "levels/hard/japan.png")] private var LevelFourteenHard:Class;
		[Embed(source = "levels/hard/lock.png")] private var LevelFifteenHard:Class;
		[Embed(source = "levels/hard/mario.png")] private var LevelSixteenHard:Class;
		[Embed(source = "levels/hard/monster.png")] private var LevelSeventeenHard:Class;
		[Embed(source = "levels/hard/mushroom.png")] private var LevelEighteenHard:Class;
		[Embed(source = "levels/hard/note.png")] private var LevelNineteenHard:Class;
		[Embed(source = "levels/hard/palm-tree.png")] private var LevelTwentyHard:Class;
		[Embed(source = "levels/hard/pencil.png")] private var LevelTwentyOneHard:Class;
		
		/*
		[Embed(source = "levels/hard/rabbit.png")] private var LevelTwentyTwo:Class;
		[Embed(source = "levels/hard/shell.png")] private var LevelTwentyThree:Class;
		[Embed(source = "levels/hard/spikes.png")] private var LevelTwentyFour:Class;
		[Embed(source = "levels/hard/stairs.png")] private var LevelTwentyFive:Class;
		[Embed(source = "levels/hard/stopwatch.png")] private var LevelTwentySix:Class;
		[Embed(source = "levels/hard/sword.png")] private var LevelTwentySeven:Class;
		[Embed(source = "levels/hard/telephone.png")] private var LevelTwentyEight:Class;
		[Embed(source = "levels/hard/tornado.png")] private var LevelTwentyNine:Class;
		[Embed(source = "levels/hard/trashcan.png")] private var LevelThirty:Class;
		[Embed(source = "levels/hard/treasure-chest.png")] private var LevelThirtyOne:Class;
		[Embed(source = "levels/hard/umbrella.png")] private var LevelThirtyTwo:Class;
		[Embed(source = "levels/hard/watch.png")] private var LevelThirtyThree:Class;
		*/
		
		override public function MenuState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			background = new FlxSprite(Background, 0, 0, false, false);
			this.add(background);
			
			titleTop = new FlxSprite(TitleTop, (FlxG.width - 271) / 2, -42);
			titleBottom = new FlxSprite(TitleBottom, (FlxG.width - 216) / 2, -42);
			titleJapanese = new FlxSprite(TitleJapanese, (FlxG.width - 156) / 2, 80);
			
			this.add(titleTop);
			this.add(titleBottom);
			
			// Set up level array data
			if (!FlxG.levels.length) 
			{
				FlxG.levels = new FlxArray();
				FlxG.levels.push( { } );	// Push an empty object to fill the '0' position
				FlxG.levels.push( { 'levelData':LevelOneEasy, 'description':'Bomb', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwoEasy, 'description':'Heart', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelThreeEasy, 'description':'Trash Can', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFourEasy, 'description':'Pill', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFiveEasy, 'description':'Padlock', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSixEasy, 'description':'Castle', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSevenEasy, 'description':'Cherry', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelEightEasy, 'description':'Coin', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelNineEasy, 'description':'Dog', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTenEasy, 'description':'Floppy Disk', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelElevenEasy, 'description':'Gameboy', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwelveEasy, 'description':'Heart', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelThirteenEasy, 'description':'House', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFourteenEasy, 'description':'Japan', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFifteenEasy, 'description':'Lock', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSixteenEasy, 'description':'Mario', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSeventeenEasy, 'description':'Monster', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelEighteenEasy, 'description':'Mushroom', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelNineteenEasy, 'description':'Note', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwentyEasy, 'description':'Palm Tree', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwentyOneEasy, 'description':'Palm Tree', 'completed':'No', 'bestTime':'30:00' } );
				
				FlxG.levels.push( { 'levelData':LevelOneHard, 'description':'Apple', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwoHard, 'description':'Bomb', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelThreeHard, 'description':'Bottle', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFourHard, 'description':'Boulder', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFiveHard, 'description':'Candle', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSixHard, 'description':'Castle', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSevenHard, 'description':'Cherry', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelEightHard, 'description':'Coin', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelNineHard, 'description':'Dog', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTenHard, 'description':'Floppy Disk', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelElevenHard, 'description':'Gameboy', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwelveHard, 'description':'Heart', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelThirteenHard, 'description':'House', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFourteenHard, 'description':'Japan', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelFifteenHard, 'description':'Lock', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSixteenHard, 'description':'Mario', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelSeventeenHard, 'description':'Monster', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelEighteenHard, 'description':'Mushroom', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelNineteenHard, 'description':'Note', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwentyHard, 'description':'Palm Tree', 'completed':'No', 'bestTime':'30:00' } );
				FlxG.levels.push( { 'levelData':LevelTwentyOneHard, 'description':'Palm Tree', 'completed':'No', 'bestTime':'30:00' } );
			}
			
			// Create SharedObject data if it doesn't exist
			if (!FlxG.cookie.data.levels) 
			{
				FlxG.cookie.data.levels = new Array;
				for (var i:int = 0, j:int = FlxG.levels.length; i < j; i++) 
				{
					FlxG.cookie.data.levels.push({ 'completed':'No', 'bestTime':'' });
				}
			}
			
			// Load saved data from SharedObject
			for (i = 0, j = FlxG.levels.length; i < j; i++) 
			{
				if (FlxG.cookie.data.levels[i].completed == 'Yes') 
				{
					FlxG.levels[i].completed = 'Yes';
					FlxG.levels[i].bestTime = FlxG.cookie.data.levels[i].bestTime;
				}
			}
		}

		override public function update():void
		{
			super.update();
			if (playedAnimation == true) // Only play the opening animation once per game load
			{	
				ok1 = ok2 = true;
				if (ok1 && ok2 && !ok3)
				{
					ok3 = true;
					titleBottom.y = 107;;
					titleTop.y = 40;
					this.add(titleJapanese);
					
					// "Easy" difficulty button
					this.add(new FlxButton((FlxG.width - 200) / 2, 200, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), goToEasyLevelSelect, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "Easy", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "Easy", 0xffcccccc, null, 16, "center")));
					// "Hard" difficulty button
					this.add(new FlxButton((FlxG.width - 200) / 2, 240, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), goToHardLevelSelect, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "Hard", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "Hard", 0xffcccccc, null, 16, "center")));
					// "How to play" button
					this.add(new FlxButton((FlxG.width - 200) / 2, 280, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), null, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "How to Play", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "How to Play", 0xffcccccc, null, 16, "center")));
				}
			}
			else
			{
				if (titleBottom.y < 92 && ok1 == false)
					titleBottom.y ++;
				else if (titleBottom.y >= 92 && ok1 == false)
				{
					ok1 = true;	
					FlxG.quake(0.01, 0.2);
				}
				
				if (titleTop.y < 40 && ok1 == true)
					titleTop.y ++;
				else if (titleTop.y >= 40 && ok2 == false)
				{
					ok2 = true;
					FlxG.quake(0.01, 0.2);
				}
				
				if (ok1 && ok2 && !ok3)
				{
					ok3 = true;
					FlxG.flash(0xffffff, 0.2);
					FlxG.quake(0.1, 0.15);
					titleBottom.y += 15;
					//titleTop.y -= 15;
					this.add(titleJapanese);
					
					// "Easy" difficulty button
					this.add(new FlxButton((FlxG.width - 200) / 2, 200, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), goToEasyLevelSelect, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "Easy", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "Easy", 0xffcccccc, null, 16, "center")));
					// "Hard" difficulty button
					this.add(new FlxButton((FlxG.width - 200) / 2, 240, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), goToHardLevelSelect, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "Hard", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "Hard", 0xffcccccc, null, 16, "center")));
					// "How to play" button
					this.add(new FlxButton((FlxG.width - 200) / 2, 280, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), null, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "How to Play", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "How to Play", 0xffcccccc, null, 16, "center")));
					
					playedAnimation = true;
				}
			}
		}
		
		public function goToEasyLevelSelect():void
		{
			FlxG.switchState(EasyLevelSelectState);
		}
		
		public function goToHardLevelSelect():void
		{
			FlxG.switchState(LevelSelectState);
		}
	}
}
