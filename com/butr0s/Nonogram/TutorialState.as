package com.butr0s.Nonogram
{
	import com.adamatomic.flixel.*;
	import flash.display.BitmapData;

	public class TutorialState extends FlxState
	{
		private var background:FlxSprite;
		private var nextButton:FlxButton;
		private var cards:Array;
		private var step:int = 1;
		private var cardShowing:int = 1;
		
		
		[Embed(source = "images/background.png")] private var Background:Class;
		[Embed(source = "images/mouse-cursor.png")] private var MouseCursor:Class;
		[Embed(source = "images/tutorial/1.png")] private var StepOneCard:Class;
		[Embed(source = "images/tutorial/2.png")] private var StepTwoCard:Class;
		[Embed(source = "images/tutorial/3.png")] private var StepThreeCard:Class;
		[Embed(source = "images/tutorial/4.png")] private var StepFourCard:Class;
		[Embed(source = "images/tutorial/5.png")] private var StepFiveCard:Class;
		[Embed(source = "images/tutorial/6.png")] private var StepSixCard:Class;
		[Embed(source = "images/tutorial/7.png")] private var StepSevenCard:Class;
		
		override public function TutorialState():void
		{
			// Set graphic for mouse cursor
			FlxG.setCursor(MouseCursor);
			
			// Set up background
			background = new FlxSprite(Background, 0, 0, false, false);
			this.add(background);
			
			// Set up card data
			cards = new Array;
			cards.push({ });	// Push an empty object into the '0' position
			cards.push(new FlxSprite(StepOneCard, 0, 0, false, false));
			cards.push(new FlxSprite(StepTwoCard, -360, 0, false, false));
			cards.push(new FlxSprite(StepThreeCard, -360, 0, false, false));
			cards.push(new FlxSprite(StepFourCard, -360, 0, false, false));
			cards.push(new FlxSprite(StepFiveCard, -360, 0, false, false));
			cards.push(new FlxSprite(StepSixCard, -360, 0, false, false));
			cards.push(new FlxSprite(StepSevenCard, -360, 0, false, false));
			
			// Add cards to screeeeen
			for (var i:int = 1, j:int = cards.length; i <= j; i++) this.add(cards[i]);
			
			// Add "next" button
			nextButton = new FlxButton(230, 30, new FlxSprite(null, 0, 0, false, false, 100, 30, 0xffffffff), nextCard, new FlxSprite(null, 0, 0, false, false, 100, 30, 0xff333333), new FlxText(0, 3, 100, 30, "Next", 0xff000000, null, 16, "center"), new FlxText(0, 3, 100, 30, "Next", 0xffcccccc, null, 16, "center"));
			this.add(nextButton);
			
			/**
			 * Nonograms are logic puzzles. Use the numbers to the top and left of the grid as clues to fill in the correct blocks.
			 * Each number in a row or column represents sequential filled-in blocks in the grid. 
			 * The clue "5 4" in this row means there are five filled-in blocks, a space of one or more, then four more filled-in blocks.
			 * The clue "10" in this column means the entire column is filled in.
			 * Solve puzzles by filling in obvious clues first. 
			 */
			
			
		}
		
		private function nextCard():void
		{
			if (cards[step].x < 0) cards[step].x = 0;		// If the previous card hasn't moved into place yet, instantly move it
			step++;											// Increment the card stack number
			if (step >= cards.length) FlxG.switchState(MenuState);		// If we've exhausted our stack of tutorial "cards," go back to the main menu
		}
		
		override public function update():void
		{
			// Slide new card into place if needed
			if (cards[step].x < 0) cards[step].x += 5;

			super.update();
		}
	}
}
