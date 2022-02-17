/// @description Insert description here

if (playing == false) { //and !played_wrong) {
    playing = true;
    alarm[0] = length;
    audio_play_sound(aSongPart, 1, false);
    sprite_index = sCoin_rotate;
}

