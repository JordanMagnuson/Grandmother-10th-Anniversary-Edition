objId = noone; //Pass in obj.id
varName = ""; //Pass in variable name as string
originalValue = 0;
targetValue = 0;
delta = 0;
timeSpan = 0;

tweenStarted = false;

function LinearNumberTween(_id, _var, _target, _span, _start = false) {
	self.objId = _id;
	self.varName = _var;
	self.originalValue = variable_instance_get(_id, _var);
	self.targetValue = _target;
	self.timeSpan = _span;
	self.delta = (_target - self.originalValue) / _span;
	self.tweenStarted = _start;
}

function start() {
	self.tweenStarted = true;	
}