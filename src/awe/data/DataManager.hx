package awe.data;
import awe.*;
import flash.net.SharedObject;
class DataManager extends Manager {
	public var data(default, null):Map<String, Dynamic>;
	var _:SharedObject;
	public function new(name:String) {
		super();
		data = new Map<String, Dynamic>();
		_ = SharedObject.getLocal(name);
		for(f in Reflect.fields(_.data))
			data.set(f, Reflect.field(_.data, f));
	}
	public function flush():Void {
		for(k in data.keys())
			Reflect.setField(_.data, k, data.get(k));
		_.flush();
	}
}