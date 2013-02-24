import awe.*;
import awe.display.*;
import awe.geom.*;
class Respawn extends Component {
	public var x:Float;
	public var y:Float;
	var s:Geometry;
	public function new(x:Float, y:Float) {
		super();
		this.x = x;
		this.y = y;
	}
	public override function added() {
		s = owner.get(Geometry);
	}
	public function respawn() {
		s.centerX = x;
		s.bottom = y;
		owner.get(Gravity).reset();
	}
}