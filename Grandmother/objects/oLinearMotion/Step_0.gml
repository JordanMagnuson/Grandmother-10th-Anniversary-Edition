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
	
}
