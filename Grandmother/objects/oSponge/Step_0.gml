self.x = mouse_x;
self.y = mouse_y;

if(mouse_check_button(mb_left) && global.hasSponge) {
	
	var cx, cy;
	var collided = false;
	
	for(cy = self.y - self.sprite_yoffset; cy < self.y - self.sprite_yoffset + sprite_get_height(self.sprite_index); cy++) {
		for(cx = self.x - self.sprite_xoffset; cx < self.x - self.sprite_xoffset + sprite_get_width(self.sprite_index); cx++) {
			if(collision_point(cx, cy, global.dust.whiteboard, true, true)) { 
				collided = true;
				global.dust.clean(cx, cy, false);	
			}
		}
	}
	
	if(collided) {
		if(!global.dust.cleaned) self.saturation /= 1.01;
		if(!global.dust.cleaned && mouse_check_button_pressed(mb_left) && global.sponge.saturation > global.MIN_SPONGE_SATURATION) {
			self.curSndSponge01 = audio_play_sound_on(self.sndSponge01Emitter, self.sndSponge01, false, 1);	
		}	
	}
	else {
		global.dust.clean(0, 0, true);	
	}
}

if(mouse_check_button_pressed(mb_left)) {
	if(place_meeting(self.x, self.y, global.bucket)) {
		self.saturation = 1;
		if(global.hasSponge) {
			self.curSndSplash = audio_play_sound_on(self.sndSplashEmitter, self.sndSplash, false, 1);	
		}
		else {
			self.curSndSplashSmall = audio_play_sound_on(self.sndSplashSmallEmitter, self.sndSplashSmall, false, 1);
		}
	}
}