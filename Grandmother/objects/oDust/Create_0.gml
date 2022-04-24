whiteboard = instance_create_depth(0, 0, 0, oWhiteboard);
self.whiteboard.Whiteboard(global.DUST, global.SPONGE_MASK);
cleaned = false;

function Dust(_x = 0, _y = 0) {
	self.x = _x;
	self.y = _y;
	self.width = self.whiteboard.width;
	self.height = self.whiteboard.height;
}

function added() {
	self.alarm[0] = 1;	
}

function clean(_px = 0, _py = 0) {
	self.whiteboard.erase(_px - self.x, _py - self.y, global.sponge.saturation);	
}

function checkCleaned() {
	if(self.whiteboard.checkOpaquePixels(0.50) < 150) {
		self.cleaned = true;	
	}
}