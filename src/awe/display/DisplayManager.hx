package awe.display;
import awe.*;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.geom.*;
class DisplayManager extends Manager {
	var _:BitmapData;
	public var width(default, null):Int;
	public var height(default, null):Int;
	public var bgColor:Int;
	public var cameraX:Float;
	public var cameraY:Float;
	public function new(width:Int, height:Int, bgColor:Int=0xFFFFFFFF) {
		super();
		this.width = width;
		this.height = height;
		this.bgColor = bgColor;
		_ = new BitmapData(width, height);
		flash.Lib.current.addChild(new flash.display.Bitmap(_));
		cameraX = cameraY = 0;
	}
	public override function update(d:Float) {
		this.render(_);
	}
	public function render(b:BitmapData) {
		b.fillRect(b.rect, bgColor);
		renderAll(System.root);
	}
	function renderAll(e:Entity) {
		for(c in e.children) {
			var s = c.get(Sprite);
			if(s != null && !s.sticky && s.right > cameraX && s.bottom > cameraY && s.left < cameraX + width && s.top < cameraY+height) {
				var r = s.render();
				if(r.transparent) {
					var m = new Matrix();
					m.translate(s.x - cameraX, s.y - cameraY);
					_.draw(new Bitmap(r), m);
				} else
					_.copyPixels(r, r.rect, new Point(s.x - cameraX, s.y - cameraY));
			} else if(s != null && s.sticky) {
				var r = s.render();
				_.copyPixels(r, r.rect, new Point(s.x, s.y));
			}
			renderAll(c);
		}
	}
}