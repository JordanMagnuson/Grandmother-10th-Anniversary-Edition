function ClickMask(_x = 0, _y = 0, _source = noone) {
	
	self.sprite_index = _source;
	self.x = _x;
	self.y = _y;
	
	self.image_alpha = 0; //visible = false
	
}