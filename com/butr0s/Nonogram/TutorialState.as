package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;

	public class TutorialState extends FlxState
	{
		private var background:FlxSprite;
		
		override public function TutorialState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			background = new FlxSprite(Background, 0, 0, false, false);
			this.add(background);
			
			/**
			 * Nonograms are logic puzzles. Use the numbers to the top and left of the grid as clues to fill in the correct blocks.
			 * Each number in a row or column represents sequential filled-in blocks in the grid. 
			 * For example, the clue "5 4" in this row means there are five filled-in blocks, a space of one or more, followed by four blocks.
			 * The clue "10" in this column means the entire column is filled in.
			 * Solve the puzzle by filling in obvious clues first, which then help the more difficult ones.
			 */
		}

		override public function update():void
		{
			super.update();
		}
	}
}
