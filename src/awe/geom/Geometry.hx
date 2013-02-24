package awe.geom;

import awe.*;
class Geometry extends Component {
	public var collidable:Bool;
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	public var left(get, set):Float;
	public var centerX(get, set):Float;
	public var right(get, set):Float;
	public var bottom(get, set):Float;
	public var centerY(get, set):Float;
	public var top(get, set):Float;
	public function new(x:Float=0, y:Float=0, width:Float=0, height:Float=0, collidable:Bool=true) {
		super();
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.collidable = collidable;
	}
	public function collides(o:Geometry):Bool {
		return o.left <= this.right && o.right >= this.left &&
      o.top < this.bottom && o.bottom > this.top;
	}
	public inline function moveTo(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}
	public inline function moveBy(x:Float, y:Float) {
		this.x += x;
		this.y += y;
	}
	public override function toString() {
		return '$x, $y ($width x $height)';
	}
	inline function get_left():Float {
		return x;
	}
	inline function get_centerX():Float {
		return x + width*0.5;
	}
	inline function get_right():Float {
		return x + width;
	}
	inline function get_top():Float {
		return y;
	}
	inline function get_centerY():Float {
		return y + height*0.5;
	}
	inline function get_bottom():Float {
		return y + height;
	}
	inline function set_left(v):Float {
		return x = v;
	}
	inline function set_centerX(v:Float):Float {
		x = v - width*0.5;
		return v;
	}
	inline function set_right(v:Float):Float {
		x = v - width;
		return v;
	}
	inline function set_top(v):Float {
		return y = v;
	}
	inline function set_centerY(v:Float):Float {
		y = v - height*0.5;
		return v;
	}
	inline function set_bottom(v:Float):Float {
		y = v - height;
		return v;
	}
}