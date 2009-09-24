package com.butr0s.HelloWorld
{
	import com.adamatomic.flixel.*;
	import flash.display.BitmapData;
	
	public class TestState extends FlxState
	{
		private var _cursor:FlxSprite;		// Main character's cursor
		private var _background:FlxSprite;	// Tiled background
		private var _level:BitmapData;		// Loaded from a transparent PNG
		private var _timer:FlxText;			// Shows how much time the player has remaining to solve the puzzle
		private var _cursorBlockX:int = 0;	// The X block the player's cursor occupies within the 15x15 (or 10x10, etc.) puzzle
		private var _cursorBlockY:int = 0;	// The Y block
		private var _verticalClues:FlxArray = new FlxArray;
		private var _horizontalClues:FlxArray = new FlxArray;
		
		[Embed(source = "images/background.png")] private var Background:Class;
		[Embed(source = "levels/1.png")] private var LevelOneData:Class;
		
		override public function TestState():void
		{
			// Set up background
			_background = new FlxSprite(Background, 0, 0, false, false);
			this.add(_background);
			
			// Set up cursor
			_cursor = new FlxSprite(null, 104, 104, false, false, 16, 16, 0xffff0000);
			this.add(_cursor);
			
			// Set up some debug text
			_timer = new FlxText(10, 10, 94, 94, "0,0", 0xffffffff, null, 20, "left");
			this.add(_timer);
			
			// Load level into BitmapData structure
			_level = new BitmapData(15, 15);
			_level.draw(new LevelOneData);
			
			// Create "clue" numbers for rows and columns
			_verticalClues.add(new FlxText(104, 0, 16, 104, "1\n2", 0xff000000, null, 12, "center"));
			_verticalClues.add(new FlxText(120, 0, 16, 104, "\n\n\n\n3\n2", 0xff000000, null, 14, "center"));
			this.add(_verticalClues[0]);
			this.add(_verticalClues[1]);
			
			_horizontalClues.add(new FlxText(0, 104, 104, 16, "5 2", 0xff000000, null, 14, "right"));
			this.add(_horizontalClues[0]);
		}

		override public function update():void
		{
			// Move cursor
			if (FlxG.justPressed(FlxG.UP) && _cursorBlockY > 0)
			{
				_cursor.y -= 16;
				_cursorBlockY--;
			}
			if (FlxG.justPressed(FlxG.DOWN) && _cursorBlockY < 15)
			{
				_cursor.y += 16;
				_cursorBlockY++;
			}
			if (FlxG.justPressed(FlxG.LEFT) && _cursorBlockX > 0)
			{
				_cursor.x -= 16;
				_cursorBlockX--;
			}
			if (FlxG.justPressed(FlxG.RIGHT) && _cursorBlockX < 15)
			{
				_cursor.x += 16;
				_cursorBlockX++;
			}
			
			if (FlxG.justPressed(FlxG.A))
			{
				// Hit!
				if (_level.getPixel(_cursorBlockX, _cursorBlockY).toString(16) == "0")
					this.add(new FlxSprite(null, _cursor.x, _cursor.y, false, false, 16, 16, 0xff00ff00));
				// Miss!
				else
					FlxG.quake(0.01, 0.2);
			}
			
			_timer.setText(_cursorBlockX + ", " + _cursorBlockY);
			
			super.update();
		}
		
	}
}
