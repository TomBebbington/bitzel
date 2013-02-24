import awe.*;
import awe.input.*;
import awe.geom.*;
import flash.Lib;
import awe.display.*;
import awe.data.*;
import flash.text.TextFormat;
import Assets;
class Main {
	static function amain() {
		System.add(new DisplayManager(640, 480, 0xFF2BBFBD));
		System.add(new InputManager());
		System.add(new CollisionManager());
		System.add(new DataManager("tophattedcoder-pieland"));
		System.add(new LevelManager());
	}
	static function main() {
		try amain() catch(e:Dynamic) trace(e);
	}
}