tweenActive = false;
callbackFunction = noone;
easeFunction = noone;
timeScale = 0.0;
framesElapsed = 0.0;
targetTime = 0.0;
tweenFinish = false;

destroyOnFinish = false;

function Tween(_duration, _destroyOnFinish = true, _callback = noone, _ease = noone) {
	self.targetTime = _duration;
	self.callbackFunction = _callback;
	self.easeFunction = _ease;
	self.destroyOnFinish = _destroyOnFinish;
}

function start() {
	self.framesElapsed = 0.0;
	if(self.targetTime == 0.0) {
		self.tweenActive = false;
		return;
	}
	self.tweenActive = true;
}

function cancel() {
	self.tweenActive = false;
}

function finish() {
	self.tweenFinish = false;
	if(noone != self.callbackFunction) self.callbackFunction();
	if(self.destroyOnFinish) instance_destroy(self.id);
	self.tweenActive = false;
}

function getPercent() {
	return self.framesElapsed / self.targetTime;	
}

function setPercent(_val) {
	self.framesElapsed = self.targetTime * _val;	
}

function scale() {
	return self.timeScale;
}