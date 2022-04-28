//if (alphaTween)
//				(graphic as Image).alpha = alphaTween.alpha;

if(mouse_check_button(mb_left))
	lastPressCounter = 0;
else
	lastPressCounter += (delta_time / 1000000)
	
show_debug_message("last mouse press: " + string(lastPressCounter));

x = mouse_x;
y = mouse_y;

var overlapVase = collision_circle(x, y, 2, oVase, 0, 1);
var overlapBucket = collision_circle(x, y, 2, oBucket, 0, 1);

			if (overlapVase && !global.vase.filled && mouse_check_button(mb_left))
			{
				global.vase.fill();
			}
			else if (overlapVase && !global.vase.filled)
			{
				global.sponge.image_alpha = 0;
				sprite_index = spr_hand_icon;
				image_alpha = 1;
			}
			
			else if (global.hasSponge)
			{
				global.sponge.image_alpha = 1;
				image_alpha = 0;
			}
			else if (overlapBucket)
			{
				global.sponge.image_alpha = 0;
				sprite_index = spr_hand_icon;
				image_alpha = 1;				
				if (mouse_check_button(mb_left) && !global.hasSponge)
				{
					global.hasSponge = true;
				}
			}			
			else
			{
				global.sponge.image_alpha = 0;
				sprite_index = spr_cursor_icon;
				image_alpha = 1;				
			}