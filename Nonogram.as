package {
	import com.adamatomic.flixel.FlxGame;
	import com.butr0s.Nonogram.LevelSelectState;
	
	[SWF(width="360", height="360", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class Nonogram extends FlxGame
	{
		public function Nonogram():void
		{
			// width, height, starting game state, zoom level, background, show flixel logo, flixel color, flixel sound, frame
			super(360, 360, LevelSelectState, 1, 0xff000000, false, 0xff000000);
			help("Mark", "Fill", "Nothing");	// X, C, Mouse
		}
	}
}
