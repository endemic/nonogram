package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;
	import com.adamatomic.flixel.data.FlxAnim;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class PlayState extends FlxState
	{
		private var _cursor:FlxSprite;							// Player's cursor
		private var _background:FlxSprite;						// Stage background
		private var _level:BitmapData;							// Level puzzle data; loaded from transparent PNG
		private var _timer:FlxText;								// Shows how much time the player has remaining to solve the puzzle
		private var _cursorBlockX:int = 0;						// The X block the player's cursor occupies within the 15x15 (or 10x10, etc.) puzzle
		private var _cursorBlockY:int = 0;						// The Y block
		private var _verticalClues:FlxArray = new FlxArray;		// Clues for columns
		private var _horizontalClues:FlxArray = new FlxArray;	// Clues for rows
		private var _tiles:FlxArray = new FlxArray;				// 2D array of FlxSprites that show filled in/marked tiles
		private var _e:FlxEmitter;								// Particle emitter for effect when correct tile is filled in
		private var _filledInBlocks:int = 0;					// Number of correctly filled in blocks. Tracked for win condition
		private var _totalBlocks:int = 0;						// Total number of blocks player must fill in. Tracked for win condition
		private var levelSize:int = 15;							// Number of tiles in the puzzle (square)
		
		[Embed(source = "images/cursor.png")] private var Cursor:Class;
		[Embed(source = "images/background.png")] private var Background:Class;
		[Embed(source = "images/tiles.png")] private var Tiles:Class;
		[Embed(source = "images/particle.png")] private var Particle:Class;
		[Embed(source = "levels/1.png")] private var LevelOne:Class;
		
		override public function PlayState():void
		{
			// Counters used in various loops
			var i:int, j:int, k:int;
			
			// Set graphic for mouse cursor
			FlxG.setCursor(Cursor);
			
			// Set up background
			_background = new FlxSprite(Background, 0, 0, false, false);
			this.add(_background);
			
			// Set up tiles
			for (i = 0; i < levelSize; i++) 
			{
				_tiles.add(new FlxArray);
				for (j = 0; j < levelSize; j++)
				{
					_tiles[i].add(new FlxSprite(Tiles, 120 + (i * 16), 120 + (j * 16), true));
					this.add(_tiles[i][j]);
				}
			}
			
			// Set up horizontal lines that help show subsections of the puzzle
			this.add(new FlxSprite(null, 120, 120 + (5 * 16), false, false, 16 * 15, 1, 0xff333333));
			this.add(new FlxSprite(null, 120, 120 + (10 * 16), false, false, 16 * 15, 1, 0xff333333));
			
			// Set up vertical lines that help show subsections of the puzzle
			this.add(new FlxSprite(null, 120 + (5 * 16), 120, false, false, 1, 16 * 15, 0xff333333));
			this.add(new FlxSprite(null, 120 + (10 * 16), 120, false, false, 1, 16 * 15, 0xff333333));
			
			// Set up cursor
			_cursor = new FlxSprite(null, 120, 120, false, false, 16, 16, 0xffff0000);
			this.add(_cursor);
			
			// Set up some debug text
			_timer = new FlxText(10, 10, 94, 94, "0,0", 0xffffffff, null, 24, "left");
			this.add(_timer);
			
			// Set up particle emitter, kill it, and add to state
			_e = new FlxEmitter(_cursor.x, _cursor.y, 16, 16, null, -0.5, -150, 150, -200, 0,-360,360,400, 0, Particle, 20, true);
			_e.kill();
			this.add(_e);
			
			// Load level into BitmapData structure
			_level = new BitmapData(levelSize, levelSize);
			_level.draw(new LevelOne);
			
			// Create "clue" FlxText objects in arrays for rows and columns
			for (i = 0; i < levelSize; i++)
			{
				_verticalClues.add(new FlxText(120 + (16 * i), 0, 16, 120, "0", 0xff000000, null, 16, "center"));
				this.add(_verticalClues[i]);
				
				_horizontalClues.add(new FlxText(0, 117 + (16 * i), 120, 16, "0", 0xff000000, null, 16, "right"));
				this.add(_horizontalClues[i]);
			}
			
			// Populate the clues
			var counterHoriz:int = 0;
			var counterVert:int = 0;
			var previousHoriz:Boolean = false;
			var previousVert:Boolean = false;
			var cluesTextHoriz:String = "";
			var cluesTextVert:String = ""
			for (i = 0; i < levelSize; i++) 
			{
				cluesTextHoriz = "";
				cluesTextVert = "";
				for (j = 0; j < levelSize; j++) 
				{
					if (_level.getPixel(j, i).toString(16) == "0")
					{
						counterHoriz++;
						previousHoriz = true;
					}
					else if (previousHoriz == true) 
					{
						cluesTextHoriz = cluesTextHoriz.concat(counterHoriz + " ");
						_totalBlocks += counterHoriz;		// This number is for our win condition - only need to count on one side, since clues are counted twice
						counterHoriz = 0;
						previousHoriz = false;
					}
					
					if (_level.getPixel(i, j).toString(16) == "0")
					{
						counterVert++;
						previousVert = true;
					}
					else if (previousVert == true) 
					{
						cluesTextVert = cluesTextVert.concat(counterVert + "\n");
						counterVert = 0;
						previousVert = false;
					}
				}
				if (cluesTextHoriz != '') _horizontalClues[i].setText(cluesTextHoriz);
				if (cluesTextVert != '') 
				{
					_verticalClues[i].setText(cluesTextVert);
					FlxG.log(String(cluesTextVert.length));
				}
			}
			
		}

		override public function update():void
		{
			// Move cursor
			if (FlxG.justPressed(FlxG.UP) && _cursorBlockY > 0)
			{
				_cursor.y -= 16;
				_cursorBlockY--;
			}
			if (FlxG.justPressed(FlxG.DOWN) && _cursorBlockY < 14)
			{
				_cursor.y += 16;
				_cursorBlockY++;
			}
			if (FlxG.justPressed(FlxG.LEFT) && _cursorBlockX > 0)
			{
				_cursor.x -= 16;
				_cursorBlockX--;
			}
			if (FlxG.justPressed(FlxG.RIGHT) && _cursorBlockX < 14)
			{
				_cursor.x += 16;
				_cursorBlockX++;
			}
			
			if (FlxG.justPressed(FlxG.A))
			{
				// Hit!
				if (_level.getPixel(_cursorBlockX, _cursorBlockY).toString(16) == "0" && _tiles[_cursorBlockX][_cursorBlockY].health != 2)
				{
					// Show some particles... move emitter to player cursor position, "kill" it (to stop existing particles), then reset (to fire it again)
					_e.x = _cursor.x;
					_e.y = _cursor.y;
					_e.kill();
					_e.reset();
					
					// Change tile underneath cursor to show that it's marked
					_tiles[_cursorBlockX][_cursorBlockY].specificFrame(2);
					
					// Show that we're one block closer to completing the puzzle
					_filledInBlocks++;
					
					// This is stupid, but I don't want to create a whole 'nother 2D array to store this info... so it's going in the "health" var
					_tiles[_cursorBlockX][_cursorBlockY].health = 2;
				}
				// Already filled in!
				else if (_tiles[_cursorBlockX][_cursorBlockY].health == 2)
				{
					// Do nothing! Maybe play a noise to show you've already filled in this box
				}
				// Miss!
				else
				{
					FlxG.quake(0.01, 0.2);
				}
			}
			
			// Mark a block for reference
			if (FlxG.justPressed(FlxG.B) && _tiles[_cursorBlockX][_cursorBlockY].health == 0)
			{
				_tiles[_cursorBlockX][_cursorBlockY].specificFrame(1);
				
				// This is stupid, but I don't want to create a whole 'nother 2D array to store this info... so it's going in the "health" var
				_tiles[_cursorBlockX][_cursorBlockY].health = 1;
			}
			else if (_tiles[_cursorBlockX][_cursorBlockY].health == 1)
			{
				_tiles[_cursorBlockX][_cursorBlockY].specificFrame(0);
				
				// This is stupid, but I don't want to create a whole 'nother 2D array to store this info... so it's going in the "health" var
				_tiles[_cursorBlockX][_cursorBlockY].health = 0;
			}
			
			// Puzzle win condition
			if (_filledInBlocks == _totalBlocks)
			{
				_filledInBlocks++;		// So this loop doesn't keep going
				FlxG.flash(0xffffffff, 0.5);
				var _finishedPuzzleOverlay:FlxSprite = new FlxSprite(LevelOne, 209, 209, false, false);		//
				_finishedPuzzleOverlay.scale = new Point(16, 16);	// Scale by a factor of 16
				this.add(new FlxSprite(null, 120, 120, false, false, 240, 240, 0xffffffff));		// White background
				this.add(_finishedPuzzleOverlay);													// Overlay of puzzle w/o lines
				
			}
			
			_timer.setText(_cursorBlockX + ", " + _cursorBlockY);
			
			super.update();
		}
		
	}
}
