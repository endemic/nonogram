package {
	import com.adamatomic.flixel.FlxGame;
	import com.butr0s.HelloWorld.TestState;
	
	[SWF(width="360", height="360", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class HelloWorld extends FlxGame
	{
		public function HelloWorld():void
		{
			// width, height, starting game state, zoom level, background, show flixel logo, flixel color, flixel sound, frame
			super(360,360,TestState,1,0xff000000,false,0xff729954);
			help("Jump", "Shoot", "Something");
		}
	}
}
