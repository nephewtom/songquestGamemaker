/// @description Insert description here

var not_playing_rest = !oNote01.playing and !oNote02.playing and !oNote03.playing;
var playing_only_first = oNote00.playing and not_playing_rest;
var playing_none = !oNote00.playing and not_playing_rest;

if (playing_none and song_percentage != 100.0) song_percentage = 0;

if (playing_only_first and song_percentage == 0) {
	song_percentage = 25;
}

if (song_percentage == 25) {
	if (oNote01.playing) {
		if (oNote00.alarm[0] >=0 and oNote00.alarm[0] <= 0.2*room_speed and oNote01.alarm[0]> oNote01.length - 0.1*room_speed )
			song_percentage = 50;
		else {
			setFail2(aError1, oNote00, oNote01, oLogicRoom0);
		}
	}
}

if (song_percentage == 50) {
	if (oNote02.playing) {
		if (oNote01.alarm[0] >=0 and oNote01.alarm[0] <= 0.2*room_speed and oNote02.alarm[0]> oNote02.length - 0.1*room_speed )
			song_percentage = 75;
		else {
			setFail2(aError1, oNote01, oNote02, oLogicRoom0);
		}
	}
}

if (song_percentage == 75) {
	if (oNote03.playing) {
		if (oNote02.alarm[0] >=0 and oNote02.alarm[0] <= 0.2*room_speed and oNote03.alarm[0]> oNote03.length - 0.1*room_speed ) {
            song_quest = true;
            song_percentage = 90;
        }
		else {
			setFail2(aError1, oNote02, oNote03, oLogicRoom0);
		}
	}
}

if (song_quest) {
	
    if ( oNote03.alarm[0] = -1) {
		song_percentage = 100;
		song_quest = false;
		audio_play_sound(aApplause, 1, false);
		alarm[10] = 2*room_speed;
	}
}
