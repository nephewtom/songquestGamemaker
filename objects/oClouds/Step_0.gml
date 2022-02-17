/// @description Insert description here


x += xDirection
if (x < 0) {
	xDirection = 1;
}


for (var i = 0; i < instance_number(oClouds); ++i;) {

	var cloud = instance_find(oClouds,i);
	if (cloud.x > room_width - sWidth) {
		xDirection = -1 + xDirection* i * 0.1;
	}
}
	