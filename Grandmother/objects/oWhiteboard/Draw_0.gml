//if(variable_global_exists("headstone") && surface_exists(global.headstone)) {
	if(!variable_global_exists("whiteboard") || !surface_exists(global.whiteboard)) {
		global.whiteboard = surface_create(self.sprite_width, self.sprite_height);
		surface_set_target(global.whiteboard);
		draw_set_alpha(1);
		//draw background once, draw dust on top of background
		gpu_set_blendmode_ext(bm_one, bm_inv_dest_alpha);
		draw_sprite_ext(self.sprite_index, 0, 0, 0, 1, 1, 0, self.image_blend, 1);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}

	if(mouse_check_button(mb_left)) {
		surface_set_target(global.whiteboard);
		draw_set_color(c_black);
		draw_set_alpha(global.sponge.saturation * global.SPONGE_DAMPEN);
		gpu_set_blendmode(bm_subtract);
		draw_sprite(self.eraser, 0, mouse_x - self.x, mouse_y - self.y);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}

	//surface_set_target(global.headstone);
	draw_surface(global.whiteboard, self.x, self.y);
	//surface_reset_target();
//}

/*
var newSurf = surface_create(512, 512);
if(surface_exists(newSurf)) {
	surface_set_target(newSurf);
	var cx, cy;
	for(cy = 0; cy < sprite_get_height(self.sprite_index); cy++) {
		for(cx = 0; cx < sprite_get_width(self.sprite_index); cx++) {
			draw_set_alpha(global.dustAlpha[cy][cx]);
			draw_point_color(cx, cy, make_color_rgb(global.dustRed, global.dustGreen[cy][cx], global.dustBlue[cy][cx]));
		}
	}
	surface_reset_target();
	draw_surface_ext(newSurf, self.x, self.y, 1, 1, 0, -1, 1);
	surface_free(newSurf);
}
*/