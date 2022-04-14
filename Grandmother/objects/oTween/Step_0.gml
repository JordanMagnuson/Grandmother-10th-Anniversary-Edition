if(self.tweenActive) {
	self.framesElapsed++;
	self.timeScale = self.framesElapsed / self.targetTime;
	if(is_method(self.easeFunction) && self.timeScale > 0 && self.timeScale < 1) self.timeScale = self.easeFunction(timeScale);
	if(self.framesElapsed >= self.targetTime) {
		self.timeScale = 1;
		self.tweenFinish = true;
	}
	
	if(self.tweenFinish) {
		self.finish();
	}
	
}