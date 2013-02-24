import awe.*;
import awe.display.*;
class Platform extends FillSprite {
	public static inline var COLOR = 0xF2B33D;
	public function new(x:Float, y:Float, w:Float, h:Float) {
		super(COLOR, w, h);
		this.centerX = x;
		this.top = y;
		this.collidable = true;
	}
}