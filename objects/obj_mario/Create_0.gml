
#macro RUN_MAX 2
#macro RUN_ACCEL 0.1
#macro FRICTION 0.1
#macro JUMP_VEL 6
#macro WEIGHT 0.25

event_inherited();

vel = new Pos(0, 0);
sub = new Pos(0, 0);
weight = WEIGHT;