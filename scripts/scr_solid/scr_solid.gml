/// @description Initialize set of instance variables needed by solids.
function scr_solid_init() {
	vel = new Pos(0, 0);
	sub = new Pos(0, 0);
	move = new Pos(0, 0);
	weight = 0;

	solidity = Solidity.SOLID;
	body = BodyType.DYNAMIC;
	parent = noone;
}