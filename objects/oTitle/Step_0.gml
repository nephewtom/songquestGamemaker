/// @description Insert description here
// You can write your code in this editor
if (image_alpha < 1) {
	image_alpha += 0.01;
}
	
if (exit_closed) {
	oLeftWall.y -= 1;
	if (oLeftWall.y == 384) {
		exit_closed = false;
	}
}
