package;

import flixel.FlxSprite;
import openfl.utils.Assets;

using StringTools;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 * I wouldn't count on that ninjamuffin99
	 */
	public var sprTracker:FlxSprite;

	public var char:String;
	public var isPlayer:Bool = false;
	public var isOldIcon:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		this.isPlayer = isPlayer;
		changeIcon(char);
		antialiasing = true;
		scrollFactor.set();
	}

	public function swapOldIcon()
	{
		isOldIcon = !isOldIcon;
		
		if (isOldIcon)
		{
			changeIcon('bf-old');
		}
		else
		{
			changeIcon(PlayState.SONG.player1);
		}
	}

	public function changeIcon(char:String)
	{
		if (char != 'bf-pixel' && char != 'bf-old')
			char = char.split('-')[0].trim();

		if (char != this.char)
		{
<<<<<<< HEAD
			if (!Assets.exists(Paths.image('icons/icon-' + char))){
				loadGraphic(Paths.image('icons/icon-face'), true, 150, 150); // wouldn't it be ironic if it didn't exist?
			}
			else {
				loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);
				animation.add(char, [0, 1], 0, false, isPlayer);
			}
=======
			var name = 'icon-' + char;
			if (!Assets.exists(Paths.image('icons/$name'))){
				loadGraphic(Paths.image('icons/icon-face'), true, 150, 150); // wouldn't it be ironic if it didn't exist?
			}
			loadGraphic(Paths.image('icons/$name'), true, 150, 150);
			animation.add(char, [0, 1], 0, false, isPlayer);
>>>>>>> d8e0e6f8e545cd096b04f781fdb483fbd3d70c35
		}
		animation.play(char);
		this.char = char;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}