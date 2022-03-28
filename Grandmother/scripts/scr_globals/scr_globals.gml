function scr_globals(){
	
	// Settings
	global.LONG_ENDING = true;
		
	// Constants
	global.PHOTO_FADE_IN_DURATION = 2.5;		// 3
	global.PHOTO_FADE_OUT_DURATION = 2.5; 	//3
	global.MIN_SPONGE_SATURATION = 0.4;
	global.WAIT_TO_DROP_BUCKET = 3;
	global.WAIT_TO_FADE = 10;
	global.FADE_OUT_DURATION = 15;
	global.LONG_ENDING_PHOTO_PAUSE_DURATION = 2;
		
	// Variables
	global.hasSponge = false;
	global.bucketDropped = false;
	global.startedFade = false;
	global.endingStarted = false;
	global.cleanHeadstone = noone; //oBitmapData
		
	// Entities
	global.SndAmbient = global.SND_AMBIENT_01;
	global.photoController = noone; //oPhotoController
	global.mouseController = noone; //oMouseController
	global.dust = noone; //oDust
	global.sponge = noone; //oSponge
	global.bucket = noone; //oBucket
	global.vase = noone; //oVase
	global.flowers = noone; //oFlowers
	
}