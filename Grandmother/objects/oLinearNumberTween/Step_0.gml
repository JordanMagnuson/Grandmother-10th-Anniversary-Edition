//Only start when specified
if(self.tweenStarted) {
	
	//Run for the number of frames specified
	if(self.timeSpan-- > 0) {
		
		//Get the current value of the given object variable
		var currentValue = variable_instance_get(self.objId, self.varName);
	
		//Increment the given object variable by the calculated step value
		variable_instance_set(self.objId, self.varName, currentValue + self.delta);
		
	}
	else {
		
		//If a callback function was specified, call it
		if(noone != self.callbackFunction) {
			self.callbackFunction();
		}
		
		instance_destroy(self.id);	
		
	}
	
}