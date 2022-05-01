if(global.dust.cleaned && global.mouseController.lastPressCounter >= global.WAIT_TO_DROP_BUCKET && !global.bucketDropped) {
	self.dropBucket();	
}

if(global.bucketDropped && global.vase.filled && !global.endingStarted) {
	var endFade = instance_create_depth(0, 0, 0, oTween);
	global.endingStarted = true;
	global.mouseController.destroy();
	if(global.LONG_ENDING) {
		endFade.Tween(global.WAIT_TO_FADE * room_speed, true, method(self.id, startLongEnding));
	}
	else {
		endFade.Tween(global.WAIT_TO_FADE * room_speed, true, method(self.id, fadeOut));	
	}
	endFade.start();
}