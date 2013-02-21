import awe.*;
import flash.Lib;
import awe.display.*;
class Main {
	static function main() {
		System.root.add(new RenderTarget(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight));
		var logo = new Entity([new ImageSprite()];
		System.root.addChild(new Entity([new FillSprite(0xFFFFFF, 300, 230).moveTo(40, 60)]));
	}
}