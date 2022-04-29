show_debug_message("game begin");
global.mouseController = instance_create_depth(0, 0, 0, oMouseController);
//******Below is waiting for oDust to be implemented
//global.dust = instance_create_depth(208, 45, 0, oDust);
//global.dust.Dust(208,45);
//global.dust.added();
global.vase = instance_create_depth(482, 339, 0, oVase);
//******Below is waiting for oBucket to be implemented
global.bucket = instance_create_depth(0, 0, 0, oBucket);
global.bucket.Bucket();
global.bucket.added();

//******Below is waiting for oSponge to be implemented
global.sponge = instance_create_depth(0, 0, 0, oSponge);
global.sponge.Sponge(0,0);
global.sponge.added();

function dropBucket(){
	global.bucketDropped = true;
	global.hasSponge = false;
	//******Below is waiting for oBucket to be implemented
	//global.bucket.drop();
}

function fadeOut(){
	if (!global.startedFade){
		//add(new FadeOut(GameOver, Colors.BLACK, Global.FADE_OUT_DURATION));
		global.startedFade = true;
	}
}

function startLongEnding(){
	//global.cleanHeadstone = FP.buffer;
	//room_goto_next(); //Go to room Leaving. 

}
		