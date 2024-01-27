
/// @description Move and perform collision checks for current instance.
function scr_physics_move() {
	
	// Perform x movement and collisions.
	sub.x += vel.x;
	move.x = int64(sub.x);
	move.y = 0;
	x += move.x;
	sub.x -= move.x;
	if (move.x != 0) scr_physics_respond();
	
	// Save x movement to reset at end.
	var movex = move.x;
	
	// Perform y movement and collisions.
	sub.y += vel.y;
	move.x = 0;
	move.y = int64(sub.y);
	y += move.y;
	sub.y -= move.y;
	if (move.y != 0) scr_physics_respond();
	
	// Restore x and y movement.
	move.x = movex;
	
	// Updating standing state, apply gravity.
	stand = scr_physics_stand();
	if (parent == noone) vel.y += weight;
}


/// @description Eject from any collisions at current position.
function scr_physics_respond() {
	var collision = scr_collision_place();
	if (!collision) return;
	
	if (body == BodyType.DYNAMIC && collision.target.body == BodyType.KINEMATIC) scr_physics_respond_dynamic_kinematic(collision);
	else if (body == BodyType.KINEMATIC && collision.target.body == BodyType.DYNAMIC) scr_physics_respond_kinematic_dynamic(collision);
}

/// @description Update standing state of current instance.
function scr_physics_stand() {
	var collision = scr_collision_box(new Box(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1), true);
	parent = collision ? collision.target : noone;
}

/// @description Handle a dynamic object colliding with a kinematic object.
function scr_physics_respond_dynamic_kinematic(collision) {
	if (move.x != 0) {
		vel.x = 0;
		if (move.x > 0) {
			// Eject leftwards.
			x = collision.box.l - 1 - (bbox_right - x);
			
		} else {
			// Eject rightwards.
			x = collision.box.r + 1 + (x - bbox_left);
		}
	} else {
		vel.y = 0;
		if (move.y > 0) {
			// Eject upwards.
			y = collision.box.t - 1 - (bbox_bottom - y);
		} else {
			// Eject downwards.
			y = collision.box.b + 1 + (y - bbox_top);
		}
	}
}

/// @description Handle a kinematic object colliding with a dynamic object.
function scr_physics_respond_kinematic_dynamic(collision) {
	if (move.x != 0) {
		if (move.x > 0) {
			// Other object ejects rightwards.
			collision.target.x = bbox_right + 1 + (collision.target.x - collision.target.bbox_left);
		} else {
			// Other object ejects leftwards.
			collision.target.x = bbox_left - 1 - (collision.target.bbox_right - collision.target.x);
		}
	} else {
		if (move.y > 0) {
			// Other object ejects downwards.
			collision.target.y = bbox_bottom + 1 + (collision.target.y - collision.target.bbox_top);
		} else {
			// Other object ejects upwards.
			collision.target.y = bbox_top - 1 - (collision.target.bbox_bottom - collision.target.y);
		}
	}
}