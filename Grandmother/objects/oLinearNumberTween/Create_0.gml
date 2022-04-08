objId = noone;
varName = "";
targetValue = 0;
delta = 0;
timeSpan = 0;

callbackFunction = noone;

tweenStarted = false;

/*
_id -> [ID] Instance ID of whichever object has the variable to be tweened
_var -> [String] Name of the variable which should be tweened
_target -> [Number] Target value the variable should reach by the end of the tween
_span -> [Number] Total time (in frames) that the tween should last
[_callback] -> [Function] Callback function to run once tween is complete [NOTE: This MUST be specified using method(id, func)]
[_start] -> [Bool] Whether the tween should immediately start or wait to be started later

Ex: LinearNumberTween(self.id, "image_alpha", 1, self.fadeInDuration, method(self.id, self.fadeInCallback));
This will tween the parent object's image_alpha to 1, over the span of the fadeInDuration. 
It will not start until .start() is called.
On completion, the parent object will call the function "fadeInCallback".
*/
function LinearNumberTween(_id, _var, _target, _span, _callback = noone, _start = false) {
	self.objId = _id;
	self.varName = _var;
	self.targetValue = _target;
	self.timeSpan = _span;
	self.delta = (_target - variable_instance_get(_id, _var)) / _span;
	self.tweenStarted = _start;
	self.callbackFunction = _callback;
}

//Begin the tween if not started via constructor
function start() {
	self.tweenStarted = true;	
}