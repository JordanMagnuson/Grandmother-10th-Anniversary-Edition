sndEnter = global.SND_BUCKET_ENTER;
motionTween = noone; //oLinearNumberTween?

bucketFront = noone;
image_alpha = 1;
function Bucket(_x = 0, _y = 0){
x = 16
y = room_height;
sprite_index = spr_bucket_front;
}

function added(){
audio_play_sound(snd_21065_bucket_enter,1,false);
show_debug_message("bucket added()");
}