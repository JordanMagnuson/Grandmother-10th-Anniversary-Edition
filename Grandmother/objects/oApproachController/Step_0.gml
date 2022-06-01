// Need to check for audio availability for some devices to play sound properly (notably mobile/ios).
if (!global.ambient_sounds_playing && audio_system_is_available() && audio_sound_is_playable(global.SndAmbient)) {
	audio_play_sound(global.SndAmbient, 1, true);	
	global.ambient_sounds_playing = true;
}