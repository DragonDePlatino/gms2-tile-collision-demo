
#macro TILE_SIZE 16
#macro COLOR_HITBOX #20d0f0
#macro COLOR_TILES #ff6050

/// @description Perform general startup initialization.
function scr_init() {
	
	// Initialize global timer.
	global.step = 0
	
	// Set up default collision code.
	global.border_top = TileType.NONE;
	global.border_bottom = TileType.NONE;
	global.border_left = TileType.NONE;
	global.border_right = TileType.NONE;
	
	// Add custom demo font.
	var font = font_add_sprite_ext(spr_font, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-×!.©", false, 0);
	draw_set_font(font);
	
	// Set default window parameters.
	global.window = new Pos(256, 224);
	global.window_scale = 3;
	window_set_size(global.window.x * global.window_scale, global.window.y * global.window_scale);
	window_set_cursor(cr_none);
	window_center();
	
	// Set default viewport parameters.
	camera_set_view_size(view_camera[0], global.window.x, global.window.y);
    view_set_wport(view_camera[0], global.window.x);
    view_set_hport(view_camera[0], global.window.y);
	
	// Open testing room.
	scr_room_goto(rm_test);
}

/// @description Initialize data associated with each tile type.
function scr_init_tileinfo() {
	
	function tile(type, solidity) {
		global.tileinfo[type] = new TileInfo(type, solidity);
	}
	
	global.tileinfo = [];
	
	tile(TileType.NONE, Solidity.NONE);
	tile(TileType.SEMISOLID, Solidity.SEMISOLID);
	tile(TileType.SOLID, Solidity.SOLID);
}

/// @description Initialize tile types located at each position in a tileset.
/// @todo Subject to improvement, could be defined a TXT, JSON, TSX, etc.
function scr_init_tilesets() {
	
	var _ = TileType.NONE;
	var s = TileType.SEMISOLID;
	var S = TileType.SOLID;

	global.tilesets = [];
	
	global.tilesets[ts_overworld] = [
		_, _, _, _, _, _, _, _, _, _, s, _, _, _, _,
		s, s, s, S, _, _, _, _, _, S, S, _, _, _, _,
		_, _, _, _, _, S, S, S, S, S, S, _, _, _, _,
		s, s, s, _, _, _, _, S, S, S, S, _, _, _, _,
		_, _, _, _, _, _, _, S, S, S, S, _, _, _, _,
		_, _, S, S, S, S, S, _, _, _, _, _, S, S, S,
	];
}
