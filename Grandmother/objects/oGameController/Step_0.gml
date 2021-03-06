if(instance_exists(global.mouseController)) {
	if(global.dust.cleaned && global.mouseController.lastPressCounter >= global.WAIT_TO_DROP_BUCKET && !global.bucketDropped) {
		self.dropBucket();
		global.sponge.image_alpha = 0;
	}

	if(global.bucketDropped && global.vase.filled && !global.endingStarted) {
		global.endingStarted = true;
		global.mouseController.destroy();
		var endFade = instance_create_depth(0, 0, 0, oTween);
		if(global.LONG_ENDING) {
			endFade.Tween((global.WAIT_TO_FADE - 1) * room_speed, true, method(self.id, startLongEnding));
		}
		else {
			endFade.Tween(global.WAIT_TO_FADE * room_speed, true, method(self.id, fadeOut));	
		}
		endFade.start();
	}
}