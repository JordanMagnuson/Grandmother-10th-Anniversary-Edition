draw_sprite_ext(self.sprite_index, -1, self.x, self.y, 1, 1, 0, -1, self.image_alpha);
draw_sprite_ext(self.spongeColorImage, -1, self.x, self.y, 1, 1, 0, -1, self.image_alpha * (global.sponge.saturation + global.MIN_SPONGE_SATURATION));
