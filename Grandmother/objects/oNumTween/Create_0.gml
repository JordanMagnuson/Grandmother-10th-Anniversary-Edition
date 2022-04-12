// Inherit the parent event
event_inherited();

startVal = 0;
range = 0;

objId = noone;
varName = "";

/*
_id -> [ID] Instance ID of whichever object has the variable to be tweened
[_destroyOnFinish] -> [Bool] Determines whether the tween object should be destroyed on finish
[_callback] -> [Function] Callback function to run once tween is complete [NOTE: This MUST be specified using method(id, func)]

Ex: self.fadeTween = NumTween(self.id, true, method(self.id, self.fadeInCallback));
This will prepare the object to run a tween.
The tween() function is used to set up the value to tween and to perform the actual tween itself.
On completion, the parent object will call the function "fadeInCallback".
*/
function NumTween(_id, _destroyOnFinish = true, _callback = noone) {
	self.objId = _id;
	self.targetTime = 0;
	self.callbackFunction = _callback;
	self.destroyOnFinish = _destroyOnFinish;
}

/*
_var -> [String] Name of the variable which should be tweened
_toValue -> [Number] The final value which should be reached for the given _var
_duration -> [Number] The number of frames the tween should run for
[_easeFunction] -> [Function] Which easing function should be used
					Can be supplied by scr_Ease or user defined
					Defaults to noone, performs a linear tween
					[NOTE: This MUST be specified using method(undefined, func)]
					
Ex: self.fadeTween.tween("image_alpha", 1, 4 * room_speed, method(undefined, bounceIn));
This will fade the image in from the current alpha value to 1 (full opacity) over 4 seconds.
It will be eased in using the bounceIn() function (defined in scr_Ease and found in net.flashpunk.utils.Ease)
*/
function tween(_var, _toValue, _duration, _easeFunction = noone) {
	
	var initialVal = variable_instance_get(self.objId, _var);
	
	self.varName = _var;
	
	self.startVal = initialVal;
	self.range = _toValue - initialVal;
	self.targetTime = _duration;
	self.easeFunction = _easeFunction;
	self.start();
	
}