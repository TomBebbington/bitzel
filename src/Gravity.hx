import awe.*;
import awe.display.*;
import awe.geom.*;
class Gravity extends Component {
	//public static inline var MAX_VELOCITY = 20;
	public var velocity(default, null):Float;
	public var acceleration(default, null):Float;
	public var bounciness(default, null):Float;
	public var jumpStrength(default, null):Float;
	var sprite:Sprite;
	public var platform(default, null):Geometry;
	public function new(accel:Float=0.5, bounciness:Float=0.3, jumpStrength=1.7) {
		super();
		sprite = null;
		velocity = 0;
		acceleration = accel;
		this.bounciness = bounciness;
		this.jumpStrength = jumpStrength;
		platform = null;
	}
	public override function added() {
		if((sprite 	 = owner.get(Sprite)) == null)
			throw "Sprite must be added before Gravity";
	}
	public override function update(dt:Float) {
		var c = System.get(CollisionManager).check(sprite);
		if(c != null && c.top + velocity + 10 >= sprite.bottom)
			bounce(c);
		else
			sprite.y += this.velocity += this.acceleration * dt * sprite.height;
	}
	public function land(v):Void {
		platform = v;
		velocity = 0;
		sprite.bottom = v.top;
	}
	public function bounce(v):Void {
		if(Math.abs(this.velocity) < sprite.height*0.2)
			land(v);
		else
			this.velocity = -this.velocity * this.bounciness;
	}
	public function reset():Void {
		velocity = 0;
		platform = null;
	}
	public function jump():Void {
		if(platform == null)
			return;
		sprite.bottom = platform.top-1;
		this.velocity = -jumpStrength * sprite.height * 0.2;
		platform = null;
	}
}