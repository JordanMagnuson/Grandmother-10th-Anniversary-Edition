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
		var tempFade = instance_create_depth(0, 0, 0, oFadeOut);
		tempFade.FadeOut(rmGameOver, global.BLACK, global.FADE_OUT_DURATION);
		tempFade.added();
		global.startedFade = true;
	}
}

function startLongEnding(){
	if(!global.startedFade) {
		var tempFade = instance_create_depth(0, 0, 0, oFadeOut);
		tempFade.FadeOut(rmLeaving, global.BLACK, 1);
		tempFade.added();
		global.startedFade = true;
	}
}
		