show_debug_message("game begin");
global.mouseController = instance_create_depth(0, 0, 0, oMouseController);
global.dust = instance_create_depth(0, 0, 0, oDust);
global.dust.Dust(208, 45);
global.dust.added();
global.vase = instance_create_depth(0, 0, 0, oVase);
global.vase.Vase(482, 339);
global.bucket = instance_create_depth(0, 0, 0, oBucket);
global.bucket.Bucket();
global.bucket.added();

global.sponge = instance_create_depth(0, 0, 0, oSponge);
global.sponge.Sponge(0,0);
global.sponge.added();

function dropBucket(){
	global.bucketDropped = true;
	global.hasSponge = false;
	global.bucket.drop();
}

function fadeOut(){
	if (!global.startedFade){
		//add(new FadeOut(GameOver, Colors.BLACK, Global.FADE_OUT_DURATION));
		var tempFade = instance_create_depth(0, 0, 0, oFadeOut);
		tempFade.FadeOut(rmGameOver, global.BLACK, global.FADE_OUT_DURATION);
		tempFade.added();
		global.startedFade = true;
	}
}

function startLongEnding(){
	//global.cleanHeadstone = FP.buffer;
	//room_goto_next(); //Go to room Leaving.
	//var activeCam = camera_get_active();
	var activeCam, xScaleRatio, yScaleRatio, xInit, yInit, width, height;
	activeCam = instance_find(oCamera, 0);
	xScaleRatio = view_wport[activeCam.target_view] / activeCam.view_width;
	yScaleRatio = view_hport[activeCam.target_view] / activeCam.view_height;
	xInit = round(-activeCam.x * xScaleRatio);
	yInit = round(-activeCam.y * yScaleRatio);
	width = round(room_width * xScaleRatio);
	height = round(room_height * yScaleRatio);
	show_debug_message("x scale: " + string(xScaleRatio) + ", y scale: " + string(yScaleRatio));
	show_debug_message("initial x: " + string(xInit) + ", initial y: " + string(yInit) + ", surface width: " + string(width) + ", surface height: " + string(height));
	global.cleanHeadstone = sprite_create_from_surface(application_surface, xInit, yInit, width, height, false, false, 0, 0);
	room_goto(rmLeaving);
}
		