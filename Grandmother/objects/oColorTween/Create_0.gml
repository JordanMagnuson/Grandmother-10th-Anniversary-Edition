// Inherit the parent event
event_inherited();

objId = noone;

red = 0;
green = 0;
blue = 0;
startAlpha = 0;
startRed = 0;
startGreen = 0;
startBlue = 0;
rangeAlpha = 0;
rangeRed = 0;
rangeGreen = 0;
rangeBlue = 0;

ALPHA = "image_alpha";
COLOR = "image_blend";

function ColorTween(_objId, _destroyOnFinish = true, _callback = noone) {
	self.objId = _objId;
	self.targetTime = 0;
	self.callbackFunction = _callback;
	self.destroyOnFinish = _destroyOnFinish;
}

function tween(_duration, _fromColor, _toColor, _fromAlpha = 1, _toAlpha = 1, _easeFunction = noone) {

	_fromColor = getRGB(_fromColor) & 0xFFFFFF;
	_toColor = getRGB(_toColor) & 0xFFFFFF;
	self.red = _fromColor >> 16 & 0xFF;
	self.green = _fromColor >> 8 & 0xFF;
	self.blue = _fromColor & 0xFF;
	self.startRed = self.red / 255;
	self.startGreen = self.green / 255;
	self.startBlue = self.blue / 255;
	self.rangeRed = ((_toColor >> 16 & 0xFF) / 255) - self.startRed;
	self.rangeGreen = ((_toColor >> 8 & 0xFF) / 255) - self.startGreen;
	self.rangeBlue = ((_toColor & 0xFF) / 255) - self.startBlue;
	self.startAlpha = _fromAlpha;
	variable_instance_set(self.objId, self.ALPHA, _fromAlpha);
	variable_instance_set(self.objId, self.COLOR, numColor(_fromColor));
	self.rangeAlpha = _toAlpha - _fromAlpha;
	self.targetTime = _duration;
	self.easeFunction = _easeFunction;
	self.start();

}

function rgb() {
	return (self.red << 16) | (self.green << 8) | (self.blue);	
}