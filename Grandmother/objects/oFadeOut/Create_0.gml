_alphaTween = noone; //oColorTween
_duration = 0;
_color = noone; //Color
_buffer = 0;
_goto = noone; //Use room index

self.alarm[0] = -1;

function FadeOut(_goto, _color = global.BLACK, _duration = 3, _buffer = 0) {
	self._duration = _duration * room_speed;
	self._color = _color;
	self._buffer = _buffer * room_speed;
	self._goto = _goto;
	
	//graphic set in Draw event
	self.image_alpha = 0;
	self.depth = -10000;
	show_debug_message("ColorTween create");
	self._alphaTween = instance_create_depth(0, 0, 0, oColorTween);
	self._alphaTween.ColorTween(self.id, true, method(self.id, self.startBuffer));
}

function added() {
	show_debug_message("ColorTween start");
	self._alphaTween.tween(self._duration, global.BLACK, self._color, 0, 1);
	show_debug_message("ColorTween started");
}

function startBuffer() {
	if(self._buffer > 0) {
		self.alarm[0] = self._buffer;
	}
	else {
		self.switchWorlds();	
	}
}

function switchWorlds() {
	show_debug_message("Switch worlds");
	room_goto(self._goto);
}