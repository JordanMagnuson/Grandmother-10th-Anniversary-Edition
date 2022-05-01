if(!self.filled && mouse_check_button_pressed(mb_left) && collision_point(mouse_x, mouse_y, oVase, true, false)) {
	filled = true;
	global.flowers = instance_create_depth(457, 0, 0, oFlowers);
	global.flowers.Flowers(457,0,true,2);
	global.flowers.added();
	global.hasSponge = false;
}