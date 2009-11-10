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
		}

		override public function update():void
		{
			super.update();
			
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
				titleTop.y -= 15;
				this.add(titleJapanese);
				
				// "Easy" difficulty button
				this.add(new FlxButton((FlxG.width - 200) / 2, 200, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), goToEasyLevelSelect, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "Easy", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "Easy", 0xffcccccc, null, 16, "center")));
				// "Hard" difficulty button
				this.add(new FlxButton((FlxG.width - 200) / 2, 240, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), goToHardLevelSelect, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "Hard", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "Hard", 0xffcccccc, null, 16, "center")));
				// "How to play" button
				this.add(new FlxButton((FlxG.width - 200) / 2, 280, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xffdddddd), null, new FlxSprite(null, 0, 0, false, false, 200, 30, 0xff333333), new FlxText(0, 3, 200, 30, "How to Play", 0xff000000, null, 16, "center"), new FlxText(0, 3, 200, 30, "How to Play", 0xffcccccc, null, 16, "center")));
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
