//Load in the color/alpha matrices for the dust pixels
loadDustColors();

for(var cy = 0; cy < array_length(global.dustAlpha); cy++) {
	for(var cx = 0; cx < array_length(global.dustAlpha[cy]); cx++) {
		global.dustAlpha[cy][cx] += 0.3;	
	}
}

whiteboard = noone;
cleaned = false;

function Dust(_x = 0, _y = 0) {
	self.x = _x;
	self.y = _y;
	
	self.whiteboard = instance_create_depth(0, 0, 0, oWhiteboard);
	self.whiteboard.Whiteboard(global.DUST);
	
}

function added() {
	self.alarm[0] = 1;	
}

function clean(_px = 0, _py = 0, _spx = 0, _spy = 0) {
	self.whiteboard.erase(_px - self.x, _py - self.y, _spx, _spy, global.sponge.saturation);	
}

function checkCleaned() {
	if(self.whiteboard.checkOpaquePixels(0.50) < 150) {
		self.cleaned = true;
	}
}