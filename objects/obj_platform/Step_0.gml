
if (timer++ >= timer_max) {
	vel = vel.multiply(-1);
	timer = 0;
}

event_inherited();