alphaTween = noone;
lastPressCounter = 0;
self.depth = -1000;

function added(){
  // Mouse.hide();
}

function fadeOut(duration){
	alphaTween = instance_create_depth(0, 0, 0, oColorTween);
	alphaTween.ColorTween(self.id, true, method(self.id, self.destroy));
	alphaTween.tween(duration, global.WHITE, global.WHITE, 1, 0);
}

function destroy(){
	instance_destroy(self.id);
}