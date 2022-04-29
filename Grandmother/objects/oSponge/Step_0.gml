self.x = mouse_x;
self.y = mouse_y;

if(mouse_check_button(mb_left) && global.hasSponge) {
	
	var cx, cy;
	
	for(cy = self.y; cy < self.y + sprite_get_height(self.sprite_index); cy++) {
		for(cx = self.x; cx < self.x + sprite_get_width(self.sprite_index); cx++) {
			if(collision_point(cx, cy, global.dust, true, true)) {
				global.dust.clean(cx, cy);
				if(!global.dust.cleaned) self.saturation /= 1.01;
				if(!global.dust.cleaned && mouse_check_button_pressed(mb_left) && global.sponge.saturation > global.MIN_SPONGE_SATURATION) {
					self.curSndSponge01 = audio_play_sound_on(self.sndSponge01Emitter, self.sndSponge01, false, 1);	
				}
			}
		}
	}	
}

if(mouse_check_button_pressed(mb_left)) {
	//self.saturation /= 1.05;
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