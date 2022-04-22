//if (alphaTween)
//				(graphic as Image).alpha = alphaTween.alpha;

if(mouse_check_button(mb_left))
	lastPressCounter = 0;
else
	lastPressCounter += (delta_time / 1000000)
	
show_debug_message("last mouse press: " + string(lastPressCounter));

x = mouse_x;
y = mouse_y;

//var overlapBucket:Bucket = collide('bucket', x, y) as Bucket;
//			var overlapVase:Vase = collide('vase', x, y) as Vase;
//			
//			if (overlapVase && !Global.vase.filled)
//			{
//				Global.sponge.visible = false;
//				graphic = handIcon;
//				visible = true;				
//				//Mouse.hide();
//			}
//			else if (Global.hasSponge)
//			{
//				Global.sponge.visible = true;
//				visible = false;
//				//Mouse.hide();
//			}
//			else if (overlapBucket)
//			{
//				Global.sponge.visible = false;
//				graphic = handIcon;
//				visible = true;
//				//Mouse.hide();
//				
//				if (Input.mousePressed && !Global.hasSponge)
//				{
//					Global.hasSponge = true;
//				}
//			}			
//			else
//			{
//				Global.sponge.visible = false;
//				graphic = cursorIcon;
//				visible = true;				
//				//Mouse.hide();
//			}