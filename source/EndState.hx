package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class EndState extends FlxState 
{
	private var _gameTitle:FlxText;
	private var _startButton:FlxButton;
	
	override public function create():Void 
	{
		// Fade in to the scene from black
		FlxG.cameras.flash(FlxColor.BLACK, 1);
		
		// Show our mouse!
		FlxG.mouse.visible = true;
		
		// Add some text to the stage as we did earlier
		_gameTitle = new FlxText(10, 90, 300, "And so the journey begins!!");
		_gameTitle.setFormat(null, 16, FlxColor.WHITE, "center");
		add(_gameTitle);
		
		// Add a button which will take us back to the main menu state
		_startButton = new FlxButton(137, 195, "", onStart);
		// Load sprites for different button states	
		_startButton.loadGraphic("assets/ok0.png");
		_startButton.onOver.callback = onStartOver;
		_startButton.onOut.callback = onStartOut;
		add(_startButton);
	}
	
	private function onStartOut():Void
	{
		_startButton.loadGraphic("assets/ok0.png");
	}
	
	private function onStartOver():Void
	{
		_startButton.loadGraphic("assets/ok1.png");
	}
	
	private function onStart():Void
	{
		FlxG.cameras.fade(FlxColor.BLACK, 1, false, onFade);
	}
	
	private function onFade():Void
	{
		FlxG.switchState(new MenuState());
	}
}