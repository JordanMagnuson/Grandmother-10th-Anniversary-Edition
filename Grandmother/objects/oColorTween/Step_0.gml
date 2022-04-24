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
	
	variable_instance_set(self.objId, self.ALPHA, self.startAlpha + self.rangeAlpha * self.timeScale);
	self.red = (self.startRed + self.rangeRed * self.timeScale) * 255;
	self.green = (self.startGreen + self.rangeGreen * self.timeScale) * 255;
	self.blue = (self.startBlue + self.rangeBlue * self.timeScale) * 255;
	variable_instance_set(self.objId, self.COLOR, numColor(self.rgb()));

}