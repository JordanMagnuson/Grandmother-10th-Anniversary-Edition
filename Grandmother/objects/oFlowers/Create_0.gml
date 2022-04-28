shouldFadeIn = true;
//public var fadeTween:ColorTween;
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
	image_alpha = 1; // this line is for now untill we get the fade in done
}

function fadeIn(_duration = 3){
	//fadeTween = new ColorTween();
	//addTween(fadeTween);		
	//fadeTween.tween(duration, Colors.WHITE, Colors.WHITE, 0, 1);	
}

