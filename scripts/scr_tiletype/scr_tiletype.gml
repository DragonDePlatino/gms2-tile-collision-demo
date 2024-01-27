
/// @description A tag for a tile's type.
enum TileType {
	NONE,
	SEMISOLID,
	SOLID
};

global.tiletype_name = ["NONE", "SEMISOLID", "SOLID"];

/// @description Get the tile type at a position in tile coordinates.
/// If a position outside the current room is queried, fallbacks on the global.border_xxx values.
function scr_tiletype_at(tilepos) {
	
	// Boundary checks outside room.
	if (tilepos.x < 0) {
		return global.border_left;
	} else if (tilepos.x >= room_width / TILE_SIZE) {
		return global.border_right;
	} else if (tilepos.y < 0) {
		return global.border_top;
	} else if (tilepos.y >= room_height / TILE_SIZE) {
		return global.border_bottom;
	}
	
	for (var i = 0; i < array_length(global.layers); ++i) {
		var tiledata = tilemap_get(global.layers[i].tilemap, tilepos.x, tilepos.y);
		var index = tile_get_index(tiledata);
		var type = global.tilesets[global.layers[i].tileset][index];
		if (type != TileType.NONE) return type;
	}
	
	return TileType.NONE;
}