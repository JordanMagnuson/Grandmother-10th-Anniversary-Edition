//clean seems to be unused
//clean = false;
eraser = noone;
//erasing = false;
//eraserMultiplier = 1;

self.x = global.dust.x;
self.y = global.dust.y;



function Whiteboard(_source, _eraser) {
	self.sprite_index = _source;
	self.eraser = _eraser;
}

/*
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
*/

/*
// LEGACY FUNCTION FOR OLD METHOD: NO LONGER USED.
function checkOpaquePixelsOld(_alphaThreshold = 0.25) {
	
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
*/

// See https://www.reddit.com/r/gamemaker/comments/60qj6u/extracting_color_values_from_images/
function checkOpaquePixels(_alphaThreshold = 0.25) {
	
	// Whiteboard surface not yet created. Return all pixels as opaque.
	var result = 0;
	if (!variable_global_exists("whiteboard") || !surface_exists(global.whiteboard)) {
		show_debug_message("global.whiteboard surface does not exist");
		return sprite_width * sprite_height;
	}
	
	// Whiteboard surface to buffer.
	var _ww = surface_get_width(global.whiteboard);
	var _hh = surface_get_height(global.whiteboard);
	//show_debug_message("surface width: " + string(_ww));
	//show_debug_message("surface height: " + string(_hh));
	var _buff = buffer_create(4 * _ww * _hh, buffer_fixed, 1); 	// Multiply by 4 here because each pixel has RGBA data.
	buffer_get_surface(_buff, global.whiteboard, 0);
	
	// Extract color info.
	for(var _y = 0; _y < _hh; _y++) {
		for(var _x = 0; _x < _ww; _x++) {
			var pixel = buffer_peek(_buff, 4 * (_x + _y * _ww), buffer_u32);	// extracts info in ABGR Format
			var alpha = (pixel >> 24) & $ff;	// Alpha [0-255]	
			//a = (pixel >> 24) & $ff;	// Alpha [0-255]	
			//r = pixel & $ff;			// Red [0-255]	
			//g = (pixel >> 8) & $ff;		// Green [0-255]	
			//b = (pixel >> 16) & $ff;	// Blue [0-255]		
			//show_debug_message("ARGB: " + string(a) + string(r) + string(g) + string(b));
			if (alpha > _alphaThreshold * 255) {
				result++;
			}
		}
	}
	
	show_debug_message("Number of opaque pixels: " + string(result));
	return result;
}

//No quick and easy method for this like in AS3, run checkOpaquePixels and return true if we get 0
function checkCompletelyErased() {
	return (self.checkOpaquePixels() == 0);
}