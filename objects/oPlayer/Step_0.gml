/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_escape)) game_end();

if (keyboard_check(vk_f1)) {
	alarm[11] = room_speed*1;
}
if (keyboard_check(vk_f2)) {
	alarm[11] = room_speed*0.5;
}
if (keyboard_check(vk_f3)) {
	alarm[11] = room_speed*0.25;
}
if (keyboard_check(vk_f4)) {
	alarm[11] = room_speed*0.1;
}
if (keyboard_check(vk_f5)) {
	alarm[11] = room_speed*0.05;
}


if (keyboard_check(vk_f11)) {
	// This is NOT working, so:
	// 1. Create an empty project with graphics on both sides and center and test it
	// 2. If the problem of breaking the aspect ratio persists, ask in GameMaker community
	if (window_get_fullscreen()) window_set_fullscreen(false);
	else window_set_fullscreen(true);
}

var xDirection;
gamepadAxisValue = gamepad_axis_value(0, gp_axislh);
if (gamepadAxisValue < -0.35) 
	xDirection = -1;
else if (gamepadAxisValue > 0.35) 
	xDirection = 1;
else {
	xDirection = 0;
	var checkLeft = keyboard_check(ord("A"));
	var checkRight = keyboard_check(ord("D"));
	xDirection = checkRight - checkLeft;
}

var onTheGround = place_meeting(x, y+1, oWall);
var pressedJump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);

if (xDirection !=0) {
    image_xscale = xDirection; // Esto sirve para que la animación del sprite cambie según sea derecha o izquierda
    baton_x_offset = xDirection*abs(baton_x_offset);
    baton.image_xscale = xDirection;
    if (!stepsPlaying and onTheGround) {
        stepsPlaying = true;
        if playFirstSteps {
            audio_play_sound(aFootsteps, 0, false);
            alarm[8] = audio_sound_length(aFootsteps) * room_speed
        }
        else {
            audio_play_sound(aFootsteps2, 0, false);
            alarm[8] = audio_sound_length(aFootsteps2) * room_speed
        }
    }
}

xSpeed = xDirection * spd;
ySpeed++;

if (onTheGround) {
	jumps = jumpsmax;
	if (xDirection !=0) { sprite_index = sPlayerRun_strip7; }
	else  { sprite_index = sPlayerIdle_strip4; }
	
}

if (pressedJump && jumps > 0) {
	sprite_index = sPlayerJump;
	ySpeed = -12;
	jumps -= 1;
}

if (place_meeting(x + xSpeed, y, oWall)) {
	
	while (!place_meeting(x + sign(xSpeed), y, oWall)) {
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
x += xSpeed;

if (place_meeting(x, y + ySpeed, oWall)) {
	while (!place_meeting(x, y + sign(ySpeed), oWall)) {
		y += sign(ySpeed);
	}	
	ySpeed = 0;
}
y += ySpeed;


// Music part
var musicButton = keyboard_check_pressed(vk_rcontrol) || gamepad_button_check_pressed(0, gp_face3);

if (musicButton) {
	if (using_baton == false) {
		using_baton = true;
		baton.image_index = 0;
		baton.depth -=1;
		baton.sprite_index = sBatuta_action;
		
		instance_create_depth(baton.x, baton.y, depth-1, oBatuta_hitBox);
	}
}

if (using_baton) {
	if (round(baton.image_index) + 2 >= baton.image_number) {
		baton.sprite_index = sBatuta;
		baton.depth +=1;
		using_baton = false;
		instance_destroy(oBatuta_hitBox);
	}
}

// TODO: Add coin animation indicating that failed..
// Check that the game mechanics work fine


// Consider use bits for this
var not_playing_rest = !playing[1] and !playing[2] and !playing[3] and !playing[4] and !playing[5];
var playing_only_first = playing[0] and not_playing_rest;
var playing_none = !playing[0] and not_playing_rest

if (playing_none and song_percentage != 100.0) song_percentage = 0;

if (playing_only_first and song_percentage == 0) {
	song_percentage = 16.666;
}
	
if (song_percentage == 16.666) {
	if (playing[1]) {
		if (alarm[0] >=0 and alarm[0] <= 0.5*room_speed and alarm[1]> lenght_part[1] - 0.1*room_speed )
			song_percentage = 33.333;
		else {
			setFail(aError1, oNote1, oNote2);
			alarm[0] = 1;
		}
	}
	if (playing[2] or playing[3] or playing[4] or playing[5]) {
		playFail(aError1, oNote1, oNote2);
	}
}

if (song_percentage == 33.333) {
	if (playing[2]) {
		if (alarm[1] >=0 and alarm[1] <= 0.55*room_speed and alarm[2]> lenght_part[2] - 0.1*room_speed )
			song_percentage = 50;
		else {
			playFail(aError2, oNote2, oNote3);			
		}
	}
	if (playing[3] or playing[4] or playing[5]) {
		playFail(aError2, oNote2, oNote3);			
	}	
}

if (song_percentage == 50) {
	if (playing[3]) {
		if (alarm[2] >=0 and alarm[2] <= 0.55*room_speed and alarm[3]> lenght_part[3] - 0.1*room_speed )
			song_percentage = 66.666;
		else {
			playFail(aError3, oNote3, oNote4);			
		}
	}
	if (playing[0] or playing[4] or playing[5]) {
		playFail(aError3, oNote3, oNote4);
	}		
}

if (song_percentage == 66.666) {
	if (playing[4]) {
		if (alarm[3] >=0 and alarm[3] <= 0.55*room_speed and alarm[4]> lenght_part[4] - 0.1*room_speed )
			song_percentage = 83.333;
		else {
			playFail(aError4, oNote4, oNote5);		
		}
	}
	if (playing[0] or playing[1] or playing[5]) {
		playFail(aError4, oNote4, oNote5);
	}	
}

if (song_percentage == 83.333) {
	if (playing[5]) {
		if (alarm[4] >=0 and alarm[4] <= 0.55*room_speed and alarm[5]> lenght_part[5] - 0.1*room_speed ) {
			song_quest = true;
			song_percentage = 90.0;
		}
		else {
			playFail(aErrorUhOh, oNote5, oNote6);
		}
	}
	if (playing[0] or playing[1] or playing[2]) {
		playFail(aErrorUhOh, oNote5, oNote6);
	}		
}


if (song_quest) {
	var previous_restarted = (alarm[4] <= lenght_part[4]) and (alarm[4] > lenght_part[4]*0.2);
	var played_wrong = playing[0] or playing[1] or playing[2] or playing[3] or previous_restarted;
	
	if (played_wrong) {
		song_quest = false;
		playFail(aErrorUhOh, oNote5, oNote6);
	}
	else if (alarm[5] <= 0.35*room_speed) {
		song_percentage = 100;
		song_quest = false;
		audio_play_sound(aApplause, 1, false);
		alarm[10] = 7*room_speed;
	}
}
