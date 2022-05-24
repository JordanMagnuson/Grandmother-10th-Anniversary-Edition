if(!variable_global_exists("whiteboard") || !surface_exists(global.whiteboard)) {
	global.whiteboard = surface_create(self.sprite_width, self.sprite_height);
	surface_set_target(global.whiteboard);
	draw_set_alpha(1);
	gpu_set_blendmode_ext(bm_one, bm_inv_dest_alpha);
	draw_sprite_ext(self.sprite_index, 0, 0, 0, 1, 1, 0, self.image_blend, 1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}

if(mouse_check_button(mb_left) && global.hasSponge) {
	surface_set_target(global.whiteboard);
	draw_set_color(c_black);
	draw_set_alpha(global.sponge.saturation * global.SPONGE_DAMPEN);
	gpu_set_blendmode(bm_subtract);
	draw_sprite(self.eraser, 0, mouse_x - self.x, mouse_y - self.y);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}

draw_surface(global.whiteboard, self.x, self.y);