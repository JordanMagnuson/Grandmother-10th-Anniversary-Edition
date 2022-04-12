if(self.tweenActive) {
	
	self.framesElapsed++;
	self.timeScale = self.framesElapsed / self.targetTime;
	if(noone != self.easeFunction && self.timeScale > 0 && self.timeScale < 1) self.timeScale = script_execute(self.easeFunction, timeScale);
	if(self.framesElapsed >= self.targetTime) {
		self.timeScale = 1;
		self.tweenFinish = true;
	}
	
	variable_instance_set(self.objId, self.varName, self.startVal + self.range * self.timeScale);
	
	if(self.tweenFinish) {
		self.finish();
	}
	
}