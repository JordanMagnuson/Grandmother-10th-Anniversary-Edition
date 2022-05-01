photoArray = [global.PHOTO_01, global.PHOTO_02, global.PHOTO_03, global.PHOTO_04, global.PHOTO_05, global.PHOTO_06, global.PHOTO_07, global.PHOTO_08, global.PHOTO_09, global.PHOTO_10, global.PHOTO_11, global.LEAVING_12, global.LEAVING_13, global.PHOTO_14, global.LEAVING_15, global.cleanHeadstone];
soundArray = [noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, noone, global.SND_DOOR_SQUEAK];
photoController = noone;

self.photoArray = reverseArray(self.photoArray);

curSndAmbient = noone;
leaveFade = noone;

if(!audio_is_playing(global.SndAmbient)) {
	self.curSndAmbient = audio_play_sound(global.SndAmbient, 1, true);	
}
self.photoController = instance_create_depth(0, 0, 0, oPhotoControllerLeaving);
self.photoController.PhotoControllerLeaving(self.photoArray, self.soundArray, global.LONG_ENDING_PHOTO_PAUSE_DURATION);
self.photoController.added();

function fadeOut() {
	if(!global.startedFade) {
		audio_sound_gain(self.curSndAmbient, 0, global.FADE_OUT_DURATION);
		self.leaveFade = instance_create_depth(0, 0, 0, oFadeOut);
		self.leaveFade.FadeOut(rmGameOver, global.BLACK, global.FADE_OUT_DURATION);
		self.leaveFade.added();
		global.startedFade = true;
	}
}