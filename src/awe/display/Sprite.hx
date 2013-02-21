package awe.display;
import awe.*;
class Sprite extends Component implements Renderable {
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	public function new() {
		super();
		x = y = width = height = 0;
	}
	public function render(bd) {

	}
	public inline function moveTo(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}
	public inline function moveBy(x:Float, y:Float) {
		this.x += x;
		this.y += y;
	}
}