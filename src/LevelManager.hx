import awe.*;
import awe.display.*;
import awe.geom.*;
import flash.text.*;
class LevelManager extends Manager {
	public var player(default, null):Entity;
	public var platforms(default, null):Array<Entity>;
	public var coins(default, null):Array<Entity>;
	public var score(default, null):Entity;
	public function new() {
		super();
		player = null;
		platforms = [];
		coins = [];
	}
	public override function added() {
		System.root.addChild(player = createPlayer(50));
		for(i in 0...20)
			addPlatform(createPlatform(i*200, Math.random()*player.get(Geometry).height*player.get(Gravity).jumpStrength, 100+Math.random()*75));
		score = createScore();
		System.root.addChild(score);
	}
	function addPlatform(p:Entity) {
		System.root.addChild(p);
		platforms.push(p);
	}
	function removePlatform(p:Entity) {
		p.parent.removeChild(p);
		platforms.remove(p);
	}
	public override function update(dt:Float) {
		var dm = System.get(DisplayManager);
		/*for(p in platforms) {
			var g = p.get(Geometry);
			if(Math.pow(g.x -dm.cameraX, 2) + Math.pow(g.y - dm.cameraY, 2) > Math.pow(dm.width*2, 2))
				removePlatform(p);
		}*/
		var btm:Float = platforms[0].get(Geometry).bottom;
		for(p in platforms)
			btm = Math.max(btm, p.get(Geometry).bottom);
		if(player.get(Geometry).top - System.get(DisplayManager).height*0.5 > btm)
			player.get(Respawn).respawn();
		var s = player.get(Collect).count;
		score.get(TextSprite).text = 'Score: $s';
	}
	function createScore() {
		var p = new Entity();
		p.add(new TextSprite("Score: 0", new TextFormat("sans")));
		p.get(Sprite).sticky = true;
		return p;
	}
	function createPlayer(x:Float=0, y:Float=0) {
		var p = new Entity();
		p.add(new FillSprite(0x292929, System.get(DisplayManager).width*0.05, System.get(DisplayManager).width*0.07));
		p.add(new Gravity());
		p.add(new Control());
		p.add(new CameraFocus());
		p.add(new Collect());
		p.add(new Respawn(x, y));
		p.get(FillSprite).centerX = x;
		p.get(FillSprite).bottom = y;
		return p;
	}
	function createPlatform(x:Float=0, y:Float=0, w:Float=16, h:Float=16) {
		var p = new Entity();
		p.add(new Platform(x, y, w, h));
		var off = w % 20;
		for(i in 0...Std.int(w/20)) {
			var c = createCoin(x+i*20 - w*0.5, y - 10);
			coins.push(c);
			awe.System.root.addChild(c);
		}
		return p;
	}
	function createCoin(x:Float=0, y:Float=0) {
		return new Entity([new Coin(x, y)]);
	}
}