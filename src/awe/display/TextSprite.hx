package awe.display;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.geom.Point;
class TextSprite extends Sprite {
	@:isVar public var text(get, set):String;
	@:isVar public var format(get, set):TextFormat;
	var _tf:TextField;
	var _bd:BitmapData;
	public function new(text:String, fmt:TextFormat) {
		super();
		_tf = new TextField();
		_bd = new BitmapData(100, 100, true);
		this.text = text;
		this.format = fmt;
		this.collidable = false;
	}
	public override function render() {
		return _bd;
	}
	inline function get_text():String {
		return this.text;
	}
	inline function set_text(t:String):String {
		updateText();
		return this.text = t;
	}
	inline function get_format():TextFormat {
		return this.format;
	}
	inline function set_format(f:TextFormat):TextFormat {
		updateText();
		return this.format = f;
	}
	function updateText() {
		if(text == null)
			return;
		if(format != null)
			_tf.defaultTextFormat = format;
		//trace(haxe.Json.stringify(format));
		_tf.text = text;
		var ln = _tf.getLineMetrics(0);
		this.width = _tf.width = ln.width+10;
		this.height = ln.ascent + ln.descent;
		_bd = new BitmapData(Std.int(width), Std.int(height), true, 0x00000000);
		_bd.draw(_tf);
	}
}