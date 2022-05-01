isClean = false;
self.depth = -500;
self.x = global.dust.x;
self.y = global.dust.y;

function Whiteboard(_source, _eraser) {
	self.sprite_index = _source;
	//Nothing to do with the eraser 
}

function erase(_px = 0, _py = 0, _spx = 0, _spy = 0, _alphaMultiplier = 1) {
	
	var newAlpha = global.dustAlpha[_py][_px] - global.SPONGE_ALPHA[_spy][_spx] * _alphaMultiplier;
	
	global.dustAlpha[_py][_px] = newAlpha < 0 ? 0 : newAlpha;
	
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