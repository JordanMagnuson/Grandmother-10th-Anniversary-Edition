x = mouse_x;
y = mouse_y;

if (global.photoController.currentPhoto.clickMask)
	var overlapClickMask = collision_circle(x, y, 2, global.photoController.currentPhoto.clickMask, 0, 1);

if (global.photoController.currentPhoto.fadeInComplete){
	if (overlapClickMask){
		if (global.photoController.currentIndex == 15)
			object_set_sprite(oMouseControllerApproach, spr_magnifying_glass_icon);
		else 
			object_set_sprite(oMouseControllerApproach, spr_feet_icon);
	}
	else
		object_set_sprite(oMouseControllerApproach, spr_cursor_icon);
	image_alpha = 1
}
else
	image_alpha = 1;
	//image_alpha = 0;		
if (overlapClickMask && mouse_check_button_pressed(mb_left) &&	global.photoController.currentPhoto.fadeInComplete)
	global.photoController.nextPhoto();
			
if (mouse_check_button_pressed(mb_left))
	global.photoController.nextPhoto();