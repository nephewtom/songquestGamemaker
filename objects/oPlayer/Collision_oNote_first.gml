/// @description Insert description here
// You can write your code in this editor

if (first_playing == false) {
	len = audio_sound_length(sNote_first);
	audio_play_sound(sNote_first, 1, false);
	alarm[0] = room_speed * len;
	first_playing = true;
}