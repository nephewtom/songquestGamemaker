/// @description Insert description here
// You can write your code in this editor
depth = 0;

spd = 4;
xSpeed = 0;
ySpeed = 0;

jumps = 0;
jumpsmax = 2;

baton = instance_create_depth(x, y, depth, oBatuta);
baton_x_offset = 30;
baton_y_offset = 4;
using_baton = false;

playing = array_create(6, false);
lenght_part = array_create(6, 0);
lenght_part[0] =  audio_sound_length(aSong_part1) * room_speed;
lenght_part[1] =  audio_sound_length(aSong_part2) * room_speed;
lenght_part[2] =  audio_sound_length(aSong_part3) * room_speed;
lenght_part[3] =  audio_sound_length(aSong_part4) * room_speed;
lenght_part[4] =  audio_sound_length(aSong_part5) * room_speed;
lenght_part[5] =  audio_sound_length(aSong_part6) * room_speed;

played_wrong = false;
wrongAudio = aError1;
wrongNote1 = oNote1;
wrongNote2 = oNote2;

song_percentage = 0;
song_quest = false;

gamepadAxisValue = 0;

//window_set_fullscreen(true);
gamepad_set_axis_deadzone(0, 0.1);

stepsPlaying = false;
playFirstSteps = true;