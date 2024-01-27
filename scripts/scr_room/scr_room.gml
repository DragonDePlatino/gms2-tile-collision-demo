
/// @description Go to specific room and cache list of tilemap layers.
function scr_room_goto(room_id) {
	room_goto(room_id);
	layer_set_target_room(room_id);
	
	global.layers = [];
	var layers = layer_get_all();
	for (var i = 0; i < array_length(layers); ++i) {
		var tilemap = layer_get_all_elements(layers[i])[0];
		if (layer_get_element_type(tilemap) != layerelementtype_tilemap) continue;
		array_push(global.layers, {
			tilemap: tilemap,
			tileset: tilemap_get_tileset(tilemap)
		});
	}
}