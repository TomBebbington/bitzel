import awe.*;
import awe.display.*;
class Coin extends FillSprite {
	static inline var COLOR = 0xCCCC00;
	public function new(x:Float, y:Float) {
		super(COLOR, 8, 8);
		this.centerX = x;
		this.centerY = y;
		this.collidable = false;
	}
}