event_inherited();

vertical = sprite_width / sprite_get_width(0) == 1;

timer = 0;
timer_max = 128;
vel = new Pos(0, -0.5);
solidity = vertical ? Solidity.SOLID : Solidity.SEMISOLID;
body = BodyType.KINEMATIC;
