
var left_input = keyboard_check(ord("A"));
var right_input = keyboard_check(ord("D"));
var jump_input = keyboard_check_pressed(ord("K"));

if (left_input) {
	vel.x = clamp(vel.x - RUN_ACCEL, -RUN_MAX, RUN_MAX);
} else if (right_input) {
	vel.x = clamp(vel.x + RUN_ACCEL, -RUN_MAX, RUN_MAX);
} else if (vel.x > 0) {
	vel.x = max(0, vel.x - FRICTION);
} else if (vel.x < 0) {
	vel.x = min(0, vel.x + FRICTION);
}

if (parent && jump_input) {
	vel.y = -JUMP_VEL;
}

event_inherited();