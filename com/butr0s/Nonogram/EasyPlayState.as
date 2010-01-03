package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;
	import com.adamatomic.flixel.data.FlxAnim;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class EasyPlayState extends FlxState
	{
		private var _cursor:FlxSprite;							// Player's cursor
		private var _background:FlxSprite;						// Stage background
		private var _level:BitmapData;							// Level puzzle data; loaded from transparent PNG
		private var _timer:FlxText;								// Shows how much time the player has remaining to solve the puzzle
		private var _timeLeft:Number = 1801;					// Time left to solve the puzzle (in seconds) - extra second is so 30:00 displays for first second
		private var _cursorBlockX:int = 0;						// The X block the player's cursor occupies within the 15x15 (or 10x10, etc.) puzzle
		private var _cursorBlockY:int = 0;						// The Y block
		private var _moveDelay:int = 0; 						// Delay factor for holding down key to move cursor
		private var _verticalClues:FlxArray = new FlxArray;		// Clues for columns
		private var _horizontalClues:FlxArray = new FlxArray;	// Clues for rows
		private var _horizontalArrow:FlxSprite;					// Arrow that helps show what clue box you should look at
		private var _verticalArrow:FlxSprite;					// Arrow that helps show what clue box you should look at
		private var _tiles:FlxArray = new FlxArray;				// 2D array of FlxSprites that show filled in/marked tiles
		private var _e:FlxEmitter;								// Particle emitter for effect when correct tile is filled in
		private var _e2:FlxEmitter;								// Particle emitter for effect when tile is marked temporarily
		private var _filledInBlocks:int = 0;					// Number of correctly filled in blocks. Tracked for win condition
		private var _totalBlocks:int = 0;						// Total number of blocks player must fill in. Tracked for win condition
		private var _misses:int = 0;							// How many incorrect guesses the player has made
		private var _levelSize:int = 10;						// Number of tiles in the puzzle (square)
		private var _tileSize:int = 16;							// Width of tile used to make up game
		private var _gameOver:Boolean = false;					// Whether player has lost this particular puzzle or not
		private var _gameOverDelayTimer:Number = 0;				// A delay after the player wins or loses the puzzle
		
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/cursor.png")] private var Cursor:Class;
		[Embed(source = "images/cursor-arrow.png")] private var CursorArrow:Class;
		[Embed(source = "images/arrow.png")] private var Arrow:Class;
		[Embed(source = "images/background-easy.png")] private var Background:Class;
		[Embed(source = "images/tiles.png")] private var Tiles:Class;
		[Embed(source = "images/particle.png")] private var Particle:Class;
		[Embed(source = "images/mark-particle.png")] private var MarkParticle:Class;
		
		[Embed(source = "sounds/dud.mp3")] private var DudSound:Class;
		[Embed(source = "sounds/hit.mp3")] private var HitSound:Class;
		[Embed(source = "sounds/miss.mp3")] private var MissSound:Class;
		[Embed(source = "sounds/move.mp3")] private var MoveSound:Class;
		
		override public function EasyPlayState():void
		{
			// Counters used in various loops
			var i:int, j:int, k:int;
			
			// Set graphic for mouse cursor
			//FlxG.setCursor(MouseCursor);
			
			// Set up background
			_background = new FlxSprite(Background, 0, 0, false, false);
			this.add(_background);
			
			// Set up tiles
			for (i = 0; i < _levelSize; i++) 
			{
				_tiles.add(new FlxArray);
				for (j = 0; j < _levelSize; j++)
				{
					_tiles[i].add(new FlxSprite(Tiles, 120 + (i * _tileSize), 120 + (j * _tileSize), true));
					_tiles[i][j].health = 0;
					this.add(_tiles[i][j]);
				}
			}
			
			// Set up horizontal lines that help show subsections of the puzzle
			this.add(new FlxSprite(null, 120, 119 + (5 * _tileSize), false, false, _tileSize * _levelSize, 1, 0xff333333));
			//this.add(new FlxSprite(null, 120, 119 + (10 * _tileSize), false, false, _tileSize * 15, 1, 0xff333333));
			
			// Set up vertical lines that help show subsections of the puzzle
			this.add(new FlxSprite(null, 120 + (5 * _tileSize), 120, false, false, 1, _tileSize * _levelSize, 0xff333333));
			//this.add(new FlxSprite(null, 120 + (10 * _tileSize), 120, false, false, 1, _tileSize * 15, 0xff333333));
			
			// Set up cursor
			_cursor = new FlxSprite(CursorArrow, 122, 116, true, false, 16, 16);
			_cursor.addAnimation("move", [0, 1, 2, 1], 1.25, true);	
			_cursor.play("move", true);
			this.add(_cursor);
			
			// Set up arrows that move along the clue area in sync with cursor
			_verticalArrow = new FlxSprite(Arrow, 122, 112, false, false);
			_horizontalArrow = new FlxSprite(Arrow, 109, 125, false, false);
			_horizontalArrow.angle = -90;		// Turn it horizontal
			this.add(_verticalArrow);
			this.add(_horizontalArrow);
			
			// Set up text for timer
			_timer = new FlxText(6, 40, 110, 110, "0,0", 0xffffffff, null, 32, "left");
			this.add(_timer);
			
			// Set up particle emitter, kill it, and add to state
			_e = new FlxEmitter(_cursor.x, _cursor.y, 8, 8, null, -0.5, -150, 150, -200, 0,-360, 360, 400, 0, Particle, 20, false);
			_e.kill();
			this.add(_e);
			
			// Set up particles, emitter, kill and add to state
			_e2 = new FlxEmitter(_cursor.x, _cursor.y, 8, 1, null, -0.5, -10, 10, 0, 50, -360, 360, 100, 0, MarkParticle, 10, false);
			_e2.kill();
			this.add(_e2);
			
			// Load level into BitmapData structure
			_level = new BitmapData(_levelSize, _levelSize);
			//_level.draw(new LevelOne);
			_level.draw(new FlxG.levels[FlxG.level].levelData);
			
			// Create "clue" FlxText objects in arrays for rows and columns
			for (i = 0; i < _levelSize; i++)
			{
				_verticalClues.add(new FlxText(118 + (_tileSize * i), 0, 18, 110, "0", 0xff000000, null, 12, "center"));
				this.add(_verticalClues[i]);
				
				_horizontalClues.add(new FlxText(0, 120 + (_tileSize * i), 110, 16, "0", 0xff000000, null, 12, "right"));
				this.add(_horizontalClues[i]);
			}
			
			// Populate/position the clues
			var counterHoriz:int = 0;
			var counterVert:int = 0;
			var previousHoriz:Boolean = false;
			var previousVert:Boolean = false;
			var cluesTextHoriz:String = "";
			var cluesTextVert:String = ""
			for (i = 0; i < _levelSize; i++) 
			{
				cluesTextHoriz = "";
				cluesTextVert = "";
				for (j = 0; j < _levelSize; j++) 
				{
					// Horizontal clues (for rows)
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
					
					// Vertical clues (for columns)
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
				
				// Condition for if a row ends with filled in blocks
				if (previousHoriz == true)
				{
					cluesTextHoriz = cluesTextHoriz.concat(counterHoriz + " ");
					_totalBlocks += counterHoriz;
					counterHoriz = 0;
					previousHoriz = false;
				}
				if (previousVert == true) 
				{
					cluesTextVert = cluesTextVert.concat(counterVert + "\n");
					counterVert = 0;
					previousVert = false;
				}
				
				// Add the text to the FlxText objects
				if (cluesTextHoriz != "")
				{
					_horizontalClues[i].setText(cluesTextHoriz);
				}
				if (cluesTextVert != "") 
				{
					_verticalClues[i].setText(cluesTextVert);
					//_verticalClues[i].y = 108 - (cluesTextVert.length / 2 * 15);
					_verticalClues[i].y = 108 - ((cluesTextVert.split("\n").length - 1) * 15);
				}
				else
				{
					_verticalClues[i].y = 93;
				}
			}
			
		}

		override public function update():void
		{
			// Only process player input if the "gameOver" variable is false
			if (!_gameOver)
			{
				// Move cursor
				if (FlxG.justPressed(FlxG.UP) && _cursorBlockY > 0)
				{
					_moveDelay = 0;
					_cursor.y -= _tileSize;
					_horizontalArrow.y -= _tileSize;
					_cursorBlockY--;
					FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
				}
				else if (FlxG.pressed(FlxG.UP) && _cursorBlockY > 0)
				{
					if (++_moveDelay % 20 == 0)
					{
						_moveDelay = 0;
						_cursor.y -= _tileSize;
						_horizontalArrow.y -= _tileSize;
						_cursorBlockY--;
						FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
					}
				}
				if (FlxG.justPressed(FlxG.DOWN) && _cursorBlockY < _levelSize - 1)
				{
					_moveDelay = 0;
					_cursor.y += _tileSize;
					_horizontalArrow.y += _tileSize;
					_cursorBlockY++;
					FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
				}
				else if (FlxG.pressed(FlxG.DOWN) && _cursorBlockY < _levelSize - 1)
				{
					if (++_moveDelay % 20 == 0)
					{
						_moveDelay = 0;
						_cursor.y += _tileSize;
						_horizontalArrow.y += _tileSize;
						_cursorBlockY++;
						FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
					}
				}
				if (FlxG.justPressed(FlxG.LEFT) && _cursorBlockX > 0)
				{
					_moveDelay = 0;
					_cursor.x -= _tileSize;
					_verticalArrow.x -= _tileSize;
					_cursorBlockX--;
					FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
				}
				else if (FlxG.pressed(FlxG.LEFT) && _cursorBlockX > 0)
				{
					if (++_moveDelay % 20 == 0)
					{
						_moveDelay = 0;
						_cursor.x -= _tileSize;
						_verticalArrow.x -= _tileSize;
						_cursorBlockX--;
						FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
					}
				}
				if (FlxG.justPressed(FlxG.RIGHT) && _cursorBlockX < _levelSize - 1)
				{
					_moveDelay = 0;
					_cursor.x += _tileSize;
					_verticalArrow.x += _tileSize;
					_cursorBlockX++;
					FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
				}
				else if (FlxG.pressed(FlxG.RIGHT) && _cursorBlockX < _levelSize - 1) 
				{
					if (++_moveDelay % 20 == 0)
					{
						_moveDelay = 0;
						_cursor.x += _tileSize;
						_verticalArrow.x += _tileSize;
						_cursorBlockX++;
						FlxG.play(MoveSound, 0.5);	// Class, volume (0 - 1)
					}
				}
			
				if (FlxG.justPressed(FlxG.B))
				{
					// Hit!
					if (_level.getPixel(_cursorBlockX, _cursorBlockY).toString(16) == "0" && _tiles[_cursorBlockX][_cursorBlockY].health != 2)
					{
						// Show some particles... move emitter to player cursor position, "kill" it (to stop existing particles), then reset (to fire it again)
						_e.x = _cursor.x;
						_e.y = _cursor.y;
						_e.kill();
						_e.reset();
					
						FlxG.play(HitSound, 0.5);	// Class, volume (0 - 1)
					
						// Change tile underneath cursor to show that it's marked
						_tiles[_cursorBlockX][_cursorBlockY].specificFrame(2);
					
						// Show that we're one block closer to completing the puzzle
						_filledInBlocks++;
					
						FlxG.log("Successfully filled in " + _filledInBlocks + " out of " + _totalBlocks + " blocks in this puzzle.");
					
						// This is stupid, but I don't want to create a whole 'nother 2D array to store this info... so it's going in the "health" var
						_tiles[_cursorBlockX][_cursorBlockY].health = 2;
					}
					// Already filled in!
					else if (_tiles[_cursorBlockX][_cursorBlockY].health == 2)
					{
						// Do nothing! Maybe play a noise to show you've already filled in this box
						FlxG.play(DudSound, 0.5);	// Class, volume (0 - 1)
					}
					// Miss!
					else
					{
						FlxG.play(MissSound, 0.5);	// Class, volume (0 - 1)
						FlxG.quake(0.01, 0.2);		// Intensity, duration
						_misses++;
						// Reduce the amount of time the player has left based on how many misses they've already had
						switch (_misses)
						{
							case 1: _timeLeft -= 120; break;	// -2 minutes
							case 2: _timeLeft -= 240; break;	// -4 minutes
							default: _timeLeft -= 480; break;	// -8 minutes
						}
					}
				}
			
				// Mark a block for reference - don't allow marking of tiles that have already been filled in
				if (FlxG.justPressed(FlxG.A) && _tiles[_cursorBlockX][_cursorBlockY].health == 0 && _tiles[_cursorBlockX][_cursorBlockY].health != 2)
				{
					_tiles[_cursorBlockX][_cursorBlockY].specificFrame(1);

					// Show some particles... move emitter to player cursor position, "kill" it (to stop existing particles), then reset (to fire it again)
					_e2.x = _cursor.x;
					_e2.y = _cursor.y + 12;
					_e2.kill();
					_e2.reset();
				
					// This is stupid, but I don't want to create a whole 'nother 2D array to store this info... so it's going in the "health" var
					_tiles[_cursorBlockX][_cursorBlockY].health = 1;
				}
				else if (FlxG.justPressed(FlxG.A) && _tiles[_cursorBlockX][_cursorBlockY].health == 1 && _tiles[_cursorBlockX][_cursorBlockY].health != 2)	// Change "marked" tile back to blank
				{
					_tiles[_cursorBlockX][_cursorBlockY].specificFrame(0);
					_tiles[_cursorBlockX][_cursorBlockY].health = 0;
				}
			}
			
			// Puzzle win condition
			if (_filledInBlocks == _totalBlocks && _gameOver == false)
			{
				_gameOver = true;
				FlxG.flash(0xffffffff, 0.5);
				var _finishedPuzzleOverlay:FlxSprite = new FlxSprite(FlxG.levels[FlxG.level].levelData, 195, 182, false, false);
				_finishedPuzzleOverlay.scale = new Point(4, 4);	// Scale by a factor of 8
				this.add(new FlxSprite(null, 120, 120, false, false, 160, 160, 0xffffffff));		// White background
				this.add(_finishedPuzzleOverlay);	// Overlay of puzzle w/o lines
				
				this.add(new FlxText(76, 130, 250, 200, "Great!", 0x000000, null, 20, "center"));
				this.add(new FlxText(101, 215, 200, 200, FlxG.levels[FlxG.level].description, 0x000000, null, 16, "center"));
				this.add(new FlxButton(141, 240, new FlxSprite(null, 0, 0, false, false, 120, 30, 0xffdddddd), goToLevelSelect, new FlxSprite(null, 0, 0, false, false, 120, 30, 0xff333333), new FlxText(0, 3, 120, 30, "Continue", 0xff000000, null, 16, "center"), new FlxText(0, 3, 120, 30, "Continue", 0xffcccccc, null, 16, "center")));
				FlxG.setCursor(MouseCursor);
				//this.add(new FlxText(101, 240, 200, 200, "Press X or C\nto continue", 0x000000, null, 12, "center"));
				
				_horizontalArrow.visible = false;	// Hide the cursor position indicator helpers
				_verticalArrow.visible = false;
				_cursor.visible = false;
				
				var tmpMinutes:int = Math.floor(_timeLeft / 60);
				var tmpSeconds:int = Math.floor(_timeLeft % 60);

				// Check if new complete time is faster
				var tmp:Array = FlxG.levels[FlxG.level].bestTime.split(':');
				//trace(tmp);
				//trace("minutes:" + tmpMinutes);
				//trace("seconds:" + tmpSeconds);
				
				if ((tmpMinutes * 60 + tmpSeconds) < (tmp[0] * 60 + tmp[1]) || FlxG.levels[FlxG.level].bestTime == '')
				{
					FlxG.levels[FlxG.level].bestTime = tmpMinutes + ":" + tmpSeconds;
					FlxG.cookie.data.levels[FlxG.level].bestTime = tmpMinutes + ":" + tmpSeconds;
				}
				
				FlxG.levels[FlxG.level].completed = 'Yes';
				FlxG.cookie.data.levels[FlxG.level].completed = "Yes";
				FlxG.cookie.flush(1000);		// Save the SharedObject data
			}
/*			
			if (_gameOver && _gameOverDelayTimer > 1 && (FlxG.justPressed(FlxG.B) || FlxG.justPressed(FlxG.A))) 
			{
				FlxG.switchState(EasyLevelSelectState);
			}
			else if (_gameOver) 
			{
				_gameOverDelayTimer += FlxG.elapsed;
			}
*/		
			// Puzzle lose condition
			if (_timeLeft <= 0 && _gameOver == false)
			{
				_gameOver = true;
				FlxG.quake(0.05, 0.5);			// Intensity, duration
				FlxG.flash(0xffffffff, 0.5);
				_timer.setText("00:00");
				this.add(new FlxSprite(null, 120, 120, false, false, 160, 160, 0xffffffff));		// White background
				
				this.add(new FlxText(76, 130, 250, 200, "You lose!", 0x000000, null, 20, "center"));
				this.add(new FlxButton(141, 240, new FlxSprite(null, 0, 0, false, false, 120, 30, 0xffdddddd), goToLevelSelect, new FlxSprite(null, 0, 0, false, false, 120, 30, 0xff333333), new FlxText(0, 3, 120, 30, "Continue", 0xff000000, null, 16, "center"), new FlxText(0, 3, 120, 30, "Continue", 0xffcccccc, null, 16, "center")));
				FlxG.setCursor(MouseCursor);
				//this.add(new FlxText(101, 240, 200, 200, "Press X or C\nto continue", 0x000000, null, 12, "center"));
				
				_horizontalArrow.visible = false;	// Hide the cursor position indicator helpers
				_verticalArrow.visible = false;
			}
			
			// Calculate remaining time and update _timer FlxText 
			if (_gameOver == false)
			{
				_timeLeft -= FlxG.elapsed;
				var minutes:String = String(Math.floor(_timeLeft / 60));
				var seconds:String = String(Math.floor(_timeLeft % 60));

				// Pad the minutes/seconds
				if (minutes.length < 2) minutes = "0" + minutes;
				if (seconds.length < 2) seconds = "0" + seconds;

				_timer.setText(minutes + ":" + seconds);
			}
			
			// Call the parent's "update" function
			super.update();
		}
	
		private function goToLevelSelect():void 
		{
			FlxG.switchState(EasyLevelSelectState);
		}
	}
}
