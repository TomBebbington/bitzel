package awe.display;
import awe.*;
import flash.geom.Rectangle;
import flash.display.BitmapData;
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
	public override function render() {
		return new BitmapData(Std.int(width), Std.int(height), false, color);
	}
}