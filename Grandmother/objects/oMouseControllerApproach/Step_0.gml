x = mouse_x;
y = mouse_y;

if (global.photoController.currentPhoto.clickMask){
	var overlapClickMask = collision_point(x, y, oClickMask, true, true);
}

if (global.photoController.currentPhoto.fadeInComplete){
	if (overlapClickMask){
		if (global.photoController.currentIndex = 15){
			sprite_index = spr_magnifying_glass_icon;
			}
		else {
			sprite_index = spr_feet_icon;}
	}
	else
		sprite_index = spr_cursor_icon;
	image_alpha = 1
}
else{
	image_alpha = 0;}

if (overlapClickMask && mouse_check_button_pressed(mb_left) &&	global.photoController.currentPhoto.fadeInComplete){
	global.photoController.nextPhoto();
}
	