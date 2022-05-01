sndEnter = global.SND_BUCKET_ENTER;
motionTween = noone; //oLinearNumberTween?

bucketFront = instance_create_depth(0, 0, -950, oBucketFront);
self.bucketFront.BucketFront(global.BUCKET_FRONT);
image_alpha = 1;
function Bucket(_x = 0, _y = 0){
	x = 16
	y = room_height;
	sprite_index = global.BUCKET;
	//depth = -950;
	self.motionTween = instance_create_depth(0, 0, 0, oLinearMotion);
	self.motionTween.LinearMotion(self.id);
}

function added(){
	audio_play_sound(snd_21065_bucket_enter,1,false);
	show_debug_message("bucket added()");
	self.motionTween.setMotion(self.x, self.y, self.x, 340, 3 * room_speed, method(undefined, quadOut));
}