
#macro RUN_MAX 1.5
#macro RUN_ACCEL 0.125
#macro FRICTION 0.125
#macro JUMP_VEL 6
#macro WEIGHT 0.25

event_inherited();

vel = new Pos(0, 0);
sub = new Pos(0, 0);
weight = WEIGHT;