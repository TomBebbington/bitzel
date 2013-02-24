import awe.geom.*;
import awe.*;
class Collect extends Component {
	public var count(default, null):Int;
	var geom:Geometry;
	var lm:LevelManager;
	public function new() {
		super();
	}
	override public function added() {
		this.geom = owner.get(Geometry);
		this.lm = System.get(LevelManager);
	}
	override public function update(dt:Float) {
		for(c in lm.coins) {
			var g = c.get(Geometry);
			if(geom.collides(g)) {
				count++;
				c.parent.removeChild(c);
				lm.coins.remove(c);
			}
		}
	}
}