
/// @description A collision detected with an instance or TileInfo.
function Collision(_box, _target) constructor {
	box = _box;
	target = _target;
}

/// @description Get a collision at a point in room space.
function scr_collision_pos(pos) {
	// Check for solid objects in room space.
	var instance = instance_position(pos.x, pos.y, obj_solid);
	if (instance != noone) return new Collision(scr_instance_box(instance), instance);
	
	// Check for tiles in tile space.
	var tilepos = pos.tilespace();
    var tileinfo = scr_tileinfo_tilepos(tilepos);
	return new Collision(tilepos.box().roomspace(), tileinfo);
}

/// @description Get a collision at a rectangle in room space.
/// @param box Box to check for collisions.
/// @param stand True if this is a standing check.
function scr_collision_box(box, stand) {
	// Check for solid objects in room space.
	var instance = collision_rectangle(box.l, box.t, box.r, box.b, obj_solid, false, true);
	if (instance != noone) {
		var collision = new Collision(scr_instance_box(instance), instance);
		if (scr_collision_valid(box, collision, stand)) return collision;
	}
	
	// Check for tiles in tile space.
	var tilebox = box.tilespace();
	for (var tilepos = tilebox.pos(); tilepos.y <= tilebox.b; ++tilepos.y) {
		for (tilepos.x = tilebox.l; tilepos.x <= tilebox.r; ++tilepos.x) {
			var tileinfo = scr_tileinfo_tilepos(tilepos);
			var collision = new Collision(tilepos.box().roomspace(), tileinfo);
			if (scr_collision_valid(box, collision, stand)) return collision;
		}
	}
}

/// @description Get collisions overlapping current hitbox.
function scr_collision_place() {
	return scr_collision_box(scr_instance_box(), false);
}

/// @description Returns true if current instance can interact with given collision.
/// @param box Collision to check.
/// @param stand True if this is a standing check.
function scr_collision_valid(box, collision, stand) {
	switch (solidity) {
	case Solidity.NONE:
		return false;
	case Solidity.SEMISOLID:
		switch (collision.target.solidity) {
		case Solidity.NONE:
			return false;
		case Solidity.SEMISOLID:
			return false;
		case Solidity.SOLID:
			// Semisolids can collide with solids they just moved upward into.
			return move.y < 0 && box.overlaps(collision.box) && !box.add(move.multiply(-1)).overlaps(collision.box);
		}
	case Solidity.SOLID:
		switch (collision.target.solidity) {
		case Solidity.NONE:
			return false;
		case Solidity.SEMISOLID:
			if (stand) {
				// Topmost point of a semisolid can be stood upon.
				return box.b == collision.box.t;
			} else {
				// Solids collide with semisolids they just move downwards into.
				return move.y > 0 && box.overlaps(collision.box) && !box.add(move.multiply(-1)).overlaps(collision.box);
			}
		case Solidity.SOLID:
			return true;
		}
	}
}