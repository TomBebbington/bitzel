package awe.display;
import awe.*;
import flash.geom.Rectangle;
class FillSprite extends Sprite {
	public var color:Int;
	public function new(color:Int, width:Float, height:Float) {
		super();
		this.color = color;
		this.width = width;
		this.height = height;
	}
	public override function update(d) {
	}
	public override function render(b) {
		b.fillRect(new Rectangle(x, y, width, height), color | 0xFF000000);
	}
}