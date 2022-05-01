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