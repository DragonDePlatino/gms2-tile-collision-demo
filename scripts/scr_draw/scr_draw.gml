
/// @description Draw a colored line.
function scr_draw_line(line, color) {
	draw_set_color(color);
	draw_line(line.s.x - 1, line.s.y, line.e.x, line.e.y);
}

/// @description Draw a colored box.
function scr_draw_box(box, color) {
	draw_set_color(color);
	draw_rectangle(box.l + 1, box.t + 1, box.r - 1, box.b - 1, 1);
}

/// @description Render the bounding box and overlapping tiles of current instance.
function scr_draw_hitbox() {
	var hitbox = scr_instance_box();
	var tilebox = hitbox.tilespace().roomspace();
	scr_draw_box(tilebox, COLOR_TILES);
	scr_draw_box(hitbox, COLOR_HITBOX);
	
	if (parent) {
		var standline = new Line(new Pos(hitbox.l, hitbox.b), new Pos(hitbox.r, hitbox.b));
		scr_draw_line(standline, #FFFFFF);
	}
}

/// @description Render colored text at a position.
function scr_draw_text(pos, text, color) {
	draw_set_color(color);
	draw_text(pos.x, pos.y, text);
}