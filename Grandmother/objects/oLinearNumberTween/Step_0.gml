if(self.tweenStarted) {
	var currentValue = variable_instance_get(self.objId, self.varName);
	if(currentValue != self.targetValue) {
		variable_instance_set(self.objId, self.varName, currentValue + self.delta);
	}
	else {
		instance_destroy(self.id);
	}
}