scr_DustAlpha();

whiteboard = noone;
cleaned = false;

function Dust(_x = 0, _y = 0) {
	self.x = _x;
	self.y = _y;
	
	self.whiteboard = instance_create_depth(0, 0, 0, oWhiteboard);
	self.whiteboard.Whiteboard(global.DUST, global.SPONGE_MASK);
	
}

function added() {
	self.alarm[0] = room_speed;	
}

function clean(_dx, _dy, _stop = false) {
	self.whiteboard.erase(_dx - self.x, _dy - self.y, _stop);
}

function checkCleaned() {
	var dirtyPixels = self.whiteboard.checkOpaquePixels(0.50)
	if(dirtyPixels < 300) {
		show_debug_message("Cleaned");
		self.cleaned = true;
	}
	else {
		show_debug_message(string(dirtyPixels) + " dirty");	
	}
}