
/// @description Information about a tile, stored in tilesets.
/// Shares many fields with obj_solid and can be treated as a physics instance.
function TileInfo(_type, _solidity) constructor {
	type = _type;
	solidity = _solidity;
	body = BodyType.KINEMATIC;
}

/// @description Get information about a tile at a position, in tile coordinates.
function scr_tileinfo_tilepos(tilepos) {
	return global.tileinfo[scr_tiletype_at(tilepos)];
}