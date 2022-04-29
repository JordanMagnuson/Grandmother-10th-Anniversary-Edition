if(self.tweenActive) {
	
	self.framesElapsed++;
	self.timeScale = self.framesElapsed / self.targetTime;
	if(noone != self.easeFunction && self.timeScale > 0 && self.timeScale < 1) self.timeScale = script_execute(self.easeFunction, timeScale);
	if(self.framesElapsed >= self.targetTime) {
		self.timeScale = 1;
		self.tweenFinish = true;
	}
	
	self.x = self.fromX + self.moveX * self.timeScale;
	self.y = self.fromY + self.moveY * self.timeScale;
	
	variable_instance_set(self.objId, "x", self.x);
	variable_instance_set(self.objId, "y", self.y);
	
	if(self.tweenFinish) {
		self.finish();
	}
	
}
