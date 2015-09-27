package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;

import haxe.Timer;

class MenuState extends FlxState 
{
	private var _test:FlxText;
	private var _bg:FlxSprite;
	private var _bgEye:FlxSprite;
	private var _startButton:FlxButton;
	private var _open1:FlxText;
	private var _open2:FlxText;
	private var _open3:FlxText;
	private var _credit:FlxText;
	
	override public function create():Void  {
		// Setup entities
		_test = new FlxUIInputText(90, 110, 300, "Guided Dream", 16, FlxColor.WHITE, FlxColor.TRANSPARENT);
		_credit = new FlxText(290, 230, 0, "ltchin", 6);

		_startButton = new FlxButton(137, 195, "", onStart);
		_startButton.loadGraphic("assets/btnStart0.png");
		_startButton.onOver.callback = onStartOver;
		_startButton.onOut.callback = onStartOut;

		// Create and hide them
		add(_test);
		add(_credit);
		add(_startButton);
		_test.kill();
		_credit.kill();
		_startButton.kill();

		//  Start the artsy opening
		opening();
	}

	private function opening():Void
	{

		var timer:Timer;

		FlxG.mouse.visible = false;
		FlxG.camera.flash(FlxColor.BLACK, 1);
		_open1 = new FlxText(105, 80, 0, "Writing is nothing more");
		_open2 = new FlxText(110, 90, 0, "than a guided dream.");
		_open3 = new FlxText(115, 110, 0, "- Jorge Luis Borges");
		add(_open1);
		add(_open2);
		add(_open3);

		timer = new Timer(3000);

		timer.run = function() {
			timer.stop();
			FlxG.camera.fade(FlxColor.BLACK, 2, false, menu, true);
		}
	}

	private function menu():Void
	{
		_open1.destroy();
		_open2.destroy();
		_open3.destroy();
		FlxG.camera.stopFX();
		FlxG.camera.flash(FlxColor.BLACK, 1);
		FlxG.mouse.visible = true;
		_test.revive();
		_credit.revive();
		_startButton.revive();
	}
	
	private function onStart():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, false, onFade);
	}
	
	private function onFade():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	private function onStartOver():Void
	{
		_startButton.loadGraphic("assets/btnStart1.png");
	}
	
	private function onStartOut():Void
	{
		_startButton.loadGraphic("assets/btnStart0.png");
	}
}