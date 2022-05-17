//clean seems to be unused
//clean = false;

eraser = noone;
erasing = false;
eraserMultiplier = 1;

self.x = global.dust.x;
self.y = global.dust.y;



function Whiteboard(_source, _eraser) {
	self.sprite_index = _source;
	self.eraser = _eraser;
}

function erase(_dx, _dy, _stop = false) {
	
	var newAlpha;

	self.erasing = !_stop;
	
	if(_dy >= array_length(global.dustAlpha)) {
		_dy = array_length(global.dustAlpha) - 1;	
	}
	
	if(_dx >= array_length(global.dustAlpha[0])) {
		_dx = array_length(global.dustAlpha[0]) - 1;	
	}

	if(instance_exists(global.sponge) && self.erasing) {
		newAlpha = global.dustAlpha[_dy][_dx] - global.sponge.saturation;
		global.dustAlpha[_dy][_dx] -= newAlpha < 0 ? 0 : newAlpha;	
	}

}

function checkOpaquePixels(_alphaThreshold = 0.25) {
	
	var cx, cy, result;
	
	result = 0;
	
	for(cy = 0; cy < array_length(global.dustAlpha); cy++) {
		for(cx = 0; cx <  array_length(global.dustAlpha[cy]); cx++) {
			if(global.dustAlpha[cy][cx] > _alphaThreshold) {
				result++;	
			}
		}
	}
	
	return result;
	
}

//No quick and easy method for this like in AS3, run checkOpaquePixels and return true if we get 0
function checkCompletelyErased() {
	return (self.checkOpaquePixels() == 0);
}