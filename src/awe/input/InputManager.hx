package awe.input;
import awe.*;
import awe.signals.*;
import flash.events.*;
import flash.Lib;
using Lambda;
class InputManager extends Manager {
	public var keyUp(default, null):Signal1<Int>;
	public var keyDown(default, null):Signal1<Int>;
	var keys:Array<Int>;
	public var mouseUp(default, null):Signal1<MouseButton>;
	public var mouseMove(default, null):Signal2<Float, Float>;
	public var mouseDown(default, null):Signal1<MouseButton>;
	public var mouseX(default, null):Float;
	public var mouseY(default, null):Float;
	public function new() {
		super();
		keys = [];
		keyUp = new Signal1();
		keyDown = new Signal1();
		mouseUp = new Signal1();
		mouseDown = new Signal1();
		mouseX = mouseY = 0;
		var c = Lib.current.stage;
		c.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		c.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		c.addEventListener(MouseEvent.MOUSE_MOVE, _onMouseMove);
		c.addEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
		c.addEventListener(MouseEvent.MOUSE_UP, _onMouseUp);
	}
	public inline function isKeyDown(key:Int):Bool {
		return keys.has(key);
	}
	function _onKeyUp(e:KeyboardEvent) {
		if(keys.has(e.keyCode)) {
			keyUp.fire(e.keyCode);
			keys.remove(e.keyCode);
		}
	}
	function _onKeyDown(e:KeyboardEvent) {
		if(!keys.has(e.keyCode)) {
			keyDown.fire(e.keyCode);
			keys.push(e.keyCode);
		}
	}
	function _onMouseMove(e:MouseEvent) {
		mouseX = e.stageX;
		mouseY = e.stageY;
		mouseMove.fire(e.stageX, e.stageY);
	}
	function _onMouseDown(e:MouseEvent) {

	}
	function _onMouseUp(e:MouseEvent) {

	}

}