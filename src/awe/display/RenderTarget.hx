package awe.display;
import awe.*;
import flash.display.BitmapData;
class RenderTarget extends Component implements Renderable {
	var _:BitmapData;
	public function new(width:Int, height:Int) {
		super();
		_ = new BitmapData(width, height);
		flash.Lib.current.addChild(new flash.display.Bitmap(_));
	}
	public override function update(d:Float) {
		this.render(_);
	}
	public function render(b:BitmapData) {
		b.fillRect(b.rect, 0xFFCC0000);
		renderAll(this.owner);
	}
	function renderAll(e:Entity) {
		for(c in e.children) {
			var s = c.get(Sprite);
			if(s != null)
				s.render(_);
			renderAll(c);
		}
	}
}