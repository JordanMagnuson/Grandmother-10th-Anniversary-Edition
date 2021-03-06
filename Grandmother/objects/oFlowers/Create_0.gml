shouldFadeIn = true;
fadeTween = noone;
fadeInDuration = 3;

function Flowers(_x = 0, _y = 0, _shouldFadeIn = true, _fadeInDuration = 3){
	x = _x;
	y = _y;
	if (_shouldFadeIn){
		shouldFadeIn = _shouldFadeIn;
		fadeInDuration = _fadeInDuration;
		image_alpha = 0;
	}
}

function added(){
	audio_play_sound(snd_33207_roses,1,false);
	if (shouldFadeIn)
		fadeIn(fadeInDuration);
}

function fadeIn(_duration = 3){
	self.fadeTween = instance_create_depth(0,0,0,oNumTween);
	self.fadeTween.NumTween(self.id, true);
	self.fadeTween.tween("image_alpha", 1, self.fadeInDuration * room_speed);
}

