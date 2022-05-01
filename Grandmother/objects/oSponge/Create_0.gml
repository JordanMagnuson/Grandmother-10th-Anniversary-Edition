//Load global sponge alpha values per pixel
loadSpongeAlpha();

self.sprite_index = global.SPONGE;
self.mask_index = global.SPONGE_MASK;
spongeColorImage = global.SPONGE_COLOR;
spongeColorEntity = noone;
sndSplashEmitter = audio_emitter_create();
sndSplash = global.SND_BUCKET_SPLASH;
curSndSplash = noone;
sndSplashSmallEmitter = audio_emitter_create();
sndSplashSmall = global.SND_BUCKET_SPLASH_SMALL;
curSndSplashSmall = noone;

sndSponge01Emitter = audio_emitter_create();
sndSponge01 = global.SND_SPONGE_01;
curSndSponge01 = noone;

saturation = 1;

function Sponge(_x = 0, _y = 0) {
	self.x = _x;
	self.y = _y;
	sprite_set_offset(self.sprite_index, sprite_get_width(self.sprite_index) / 2, sprite_get_height(self.sprite_index) / 2);
	sprite_set_offset(self.spongeColorImage, sprite_get_width(self.sprite_index) / 2, sprite_get_height(self.sprite_index) / 2);
	self.depth = -900;
	self.image_alpha = 0;
}

function added() {
	//Add spongeColorEntity?	
}

function removed() {
	//Remove spongeColorEntity?	
}