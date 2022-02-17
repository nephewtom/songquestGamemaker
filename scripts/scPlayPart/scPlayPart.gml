// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function setFail2(failSong, oNoteA, oNoteB, oLogic) {
	oNoteA.sprite_index = sCoin_wrong;
	oNoteB.sprite_index = sCoin_wrong;	
	
	oLogic.wrongAudio = failSong;
	oLogic.wrongNote1 = oNoteA;
	oLogic.wrongNote2 = oNoteB;
	oLogic.alarm[0] = room_speed*1;
}


function setFail(failSong, oNoteA, oNoteB) {
	oNoteA.sprite_index = sCoin_wrong;
	oNoteB.sprite_index = sCoin_wrong;	
	
	oPlayer.played_wrong = true;	
	oPlayer.wrongAudio = failSong;
	oPlayer.wrongNote1 = oNoteA;
	oPlayer.wrongNote2 = oNoteB;
	oPlayer.alarm[9] = room_speed*1;
}

function scPlayPart(i, song, myNote) {
	if (oPlayer.playing[i] == false ) { //and !played_wrong) {
		oPlayer.playing[i] = true;
		oPlayer.alarm[i] = oPlayer.lenght_part[i];
		audio_play_sound(song, 1, false);
		myNote.sprite_index = sCoin_rotate;
	}
}

function playFail(failSong, oNoteA, oNoteB) {
	audio_stop_all();
	audio_play_sound(failSong, 1, false);
	
	oPlayer.song_percentage = 0;
	oNoteA.sprite_index = sCoin;
	oNoteB.sprite_index = sCoin;	
}
