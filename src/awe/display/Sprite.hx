package awe.display;
import awe.*;
import flash.display.BitmapData;
class Sprite extends awe.geom.Geometry {
	public var layer:Float;
	public var sticky:Bool;
	public function new(x:Float=0, y:Float=0) {
		super(x, y);
		width = height = 0;
		layer = 0;
		sticky = false;
	}
	public function render():BitmapData {
		return null;
	}
	public override function toString():String {
		return 'Sprite at $x, $y';
	}
}