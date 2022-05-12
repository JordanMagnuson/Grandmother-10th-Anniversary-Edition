if(mouse_check_button(mb_left))
	lastPressCounter = 0;
else
	lastPressCounter += (delta_time / 1000000)
	
//show_debug_message("last mouse press: " + string(lastPressCounter));

x = mouse_x;
y = mouse_y;

var overlapVase = collision_point(self.x, self.y, oVase, false, true);
var overlapBucket = collision_point(self.x, self.y, oBucket, false, true);

if (overlapVase && !global.vase.filled)
{
	oSponge.image_alpha = 0;
	sprite_index = spr_hand_icon;
	image_alpha = 1;
}
			
else if (global.hasSponge)
{
	oSponge.image_alpha = 1;
	image_alpha = 0;
}
else if (overlapBucket)
{
	oSponge.image_alpha = 0;
	sprite_index = spr_hand_icon;
	image_alpha = 1;				
	if (mouse_check_button(mb_left) && !global.hasSponge)
	{
		global.hasSponge = true;
	}
}			
else
{
	oSponge.image_alpha = 0;
	sprite_index = spr_cursor_icon;
	image_alpha = 1;				
}