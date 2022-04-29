// Inherit the parent event
event_inherited();

fromX = 0;
fromY = 0;
moveX = 0;
moveY = 0;
dist = -1;

objId = noone;

function LinearMotion(_id, _destroyOnFinish = true, _callback = noone) {
	
	self.objId = _id;
	self.targetTime = 0;
	self.callbackFunction = _callback;
	self.destroyOnFinish = _destroyOnFinish;
	
}

function setMotion(_fromX, _fromY, _toX, _toY, _duration, _easeFunction) {
	self.dist = -1;
	self.fromX = _fromX;
	self.x = _fromX;
	self.fromY = _fromY;
	self.y = _fromY;
	self.moveX = _toX - _fromX;
	self.moveY = _toY - _fromY;
	self.targetTime = _duration;
	self.easeFunction = _easeFunction;
	self.start();
}

function setMotionSpeed(_fromX, _fromY, _toX, _toY, _speed, _easeFunction = noone) {
	self.dist = -1;
	self.fromX = _fromX;
	self.x = _fromX;
	self.fromY = _fromY;
	self.y = _fromY;
	self.moveX = _toX - _fromX;
	self.moveY = _toY - _fromY;
	self.targetTime = self.distance() / _speed;
}

function distance() {
	if(self.dist < 0) {
		self.dist = sqrt(self.moveX * self.moveX + self.moveY * self.moveY);
	}
	return self.dist;
}