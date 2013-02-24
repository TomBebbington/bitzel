import awe.*;
import awe.display.*;
class CameraFocus extends Component {
	var dm:DisplayManager;
	var os:Sprite;
	var gr:Gravity;
	public override function added() {
		dm = System.get(DisplayManager);
		os = owner.get(Sprite);
		gr = owner.get(Gravity);
	}
	public override function update(dt:Float) {
		dm.cameraX = os.x + (os.width - dm.width)*0.5;
		dm.cameraY = os.y + (os.height - dm.height)*0.7;
	}
}