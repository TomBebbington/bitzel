import awe.*;
import awe.display.*;
import awe.input.*;
class Control extends Component {
	public var speed:Float;
	var sprite:Sprite;
	var gravity:Gravity;
	public function new(speed:Float=4) {
		super();
		this.speed = speed;
	}
	public override function added() {
		sprite = owner.get(Sprite);
		gravity = owner.get(Gravity);
	}
	public override function update(dt:Float) {
		var im = System.get(InputManager);
		if(im.isKeyDown(Key.LEFT))
			sprite.x -= speed * sprite.width * dt;
		else if(im.isKeyDown(Key.RIGHT))
			sprite.x += speed * sprite.width * dt;
		if(im.isKeyDown(Key.UP) || im.isKeyDown(Key.SPACE))
			gravity.jump();
	}
}