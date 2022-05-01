sndEnterEmitter = audio_emitter_create();
sndEnter = global.SND_BUCKET_ENTER;
curSndEnter = noone;

motionTween = noone; //oLinearNumberTween?

bucketFront = noone; 

image_alpha = 1;
function Bucket(_x = 0, _y = 0){
	x = 16
	y = room_height;
	sprite_index = global.BUCKET;
	
	self.bucketFront = instance_create_depth(0, 0, -950, oBucketFront);
	self.bucketFront.BucketFront(global.BUCKET_FRONT);
	
	self.motionTween = instance_create_depth(0, 0, 0, oLinearMotion);
	self.motionTween.LinearMotion(self.id, false);
}

function added(){
	self.curSndEnter = audio_play_sound_on(self.sndEnterEmitter, self.sndEnter, false, 1);
	show_debug_message("bucket added()");
	self.motionTween.setMotion(self.x, self.y, self.x, 340, 3 * room_speed, method(undefined, quadOut));
}

function drop() {
	self.curSndEnter = audio_play_sound_on(self.sndEnterEmitter, self.sndEnter, false, 1);
	self.motionTween.setMotion(self.x, self.y, self.x, room_height + 20, 3 * room_speed, method(undefined, quadIn));
}