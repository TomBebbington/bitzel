package awe.geom;
import awe.*;
class CollisionManager extends Manager {
	public var collisions:Array<Array<Geometry>>;
	public function new() {
		super();
		collisions = [];
	}
	public function check(g:Geometry):Geometry {
		for(c in collisions)
			return if(c[0] == g)
				c[1];
			else if(c[1] == g)
				c[0];
		return null;
	}
	public override function update(dt:Float) {
		var g = search(System.root);
		collisions = [];
		for(a in g)
			for(b in g)
				if(a != b && a.collides(b))
					collisions.push([a, b]);
	}
	function search(e:Entity, ?a:Array<Geometry>):Array<Geometry> {
		if(a == null)
			a = [];
		var g = e.get(Geometry);
		if(g != null && g.collidable)
			a.push(g);
		for(c in e.children)
			search(c, a);
		return a;
	}
}