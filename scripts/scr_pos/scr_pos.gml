
/// @description An x-y coordinate pair.
function Pos(_x, _y) constructor {
    x = _x;
    y = _y;
	
	/// @description Multiply by a scalar value.
	static multiply = function(n) {
		return new Pos(x * n, y * n);
	}
	
	/// @descriptionDivide by a scalar value.
	static divide = function(n) {
		return new Pos(x / n, y / n);
	}
	
	/// @description Convert position to a pixel-sized box.
	static box = function() {
		return new Box(x, y, x, y);
	}
	
	/// @description Convert a position in room space to tile space.
	static tilespace = function() {
		return new Pos(floor(x / TILE_SIZE), floor(y / TILE_SIZE));
	}
	
	/// @description Convert a position in tile space to room space.
	static roomspace = function() {
		return new Pos(x * TILE_SIZE, y * TILE_SIZE);
	}
}