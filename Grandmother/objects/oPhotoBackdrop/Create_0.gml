clickMask = noone; //oClickMask

sound = noone; //Specific sound effect
soundEmitter = audio_emitter_create();
audio_emitter_gain(soundEmitter, 1);
curSound = noone; //Currently playing sound

fadeInDuration = 0;
fadeOutDuration = 0;
fadeInComplete = false;
fadeTween = noone; //Fading ColorTween -> wait for number tween function?

function PhotoBackdrop(_backdropSource = noone, _soundSource = noone, _fadeInDuration = 3, _fadeOutDuration = 3, _clickMaskSource = noone) {
	//Assigned as sprite index later
	//self.backdrop = _backdropSource;
	if(noone != _clickMaskSource) self.clickMask = instance_create_depth(self.x, self.y, 100, oClickMask);
	self.clickMask.ClickMask(0, 0, _clickMaskSource);
	if(noone != _soundSource) self.sound = _soundSource;
	self.sprite_index = _backdropSource;
	self.fadeInDuration = _fadeInDuration;
	self.fadeOutDuration = _fadeOutDuration;
	//Set in instance_create_depth() function
	//self.depth = 100; 
}

function added() {
	//ClickMask added during constructor
	//if (clickMask) FP.world.add(clickMask);
	if(self.fadeInDuration > 0) {
		self.image_alpha = 0;
		self.fadeIn();
	}
	else {
		self.image_alpha = 1;
		//Unneeded?
		//fadeTween = new ColorTween;
		//fadeTween.alpha = 1;
	}
}

function fadeIn() {
	if(noone != self.sound) self.curSound = audio_play_sound_on(self.soundEmitter, self.sound, false, 0);
	//fade from 0 -> 1 using fadeInDuration in a tween fashion
}

//Put this in the update tween?
function fadeInCallback() {
	self.fadeInComplete = true;
}

function fadeOut() {
	if(self.fadeOutDuration > 0) {
		//fade from current alpha -> 0 using fadeOutDuration in a tween fashion	
	}
	else {
		instance_destroy(self.id);	
	}
}