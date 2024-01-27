
/// @description An axis-aligned bounding box.
function Box(_l, _t, _r, _b) constructor {
    l = _l;
	t = _t;
	r = _r;
	b = _b;
	
	/// @description Offset a box by a position and return a new box.
	static add = function(pos) {
		return new Box(l + pos.x, t + pos.y, r + pos.x, b + pos.y);
	}
	
	/// @description Check if box is overlapping another box.
	static overlaps = function(box) {
		return l <= box.r && t <= box.b && r >= box.l && b >= box.t;
	}
	
	/// @description Get upper-left corner of box.
	static pos = function() {
		return new Pos(l, t);
	}
	
	/// @description Convert a box in room space to tile space.
	static tilespace = function() {
		return new Box(floor(l / TILE_SIZE), floor(t / TILE_SIZE), floor(r / TILE_SIZE), floor(b / TILE_SIZE));
	}
	
	/// @description Convert a box in tile space to room space.
	static roomspace = function() {
		return new Box(l * TILE_SIZE, t * TILE_SIZE, (r + 1) * TILE_SIZE - 1, (b + 1) * TILE_SIZE - 1);
	}
}