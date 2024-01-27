
var size = new Pos(sprite_width / sprite_get_width(0), sprite_height / sprite_get_height(0));
var frame = new Pos(sprite_get_width(0), sprite_get_height(0));
var offset = new Pos(sprite_get_xoffset(0), sprite_get_yoffset(0));
var sprite = size.x == 1 ? spr_platform_vertical : spr_platform_horizontal;

for (var dy = 0; dy < size.y; ++dy) {
	for (var dx = 0; dx < size.x; ++dx) {
		draw_sprite(sprite, 0, bbox_left + dx * frame.x + offset.x, bbox_top + dy * frame.y + offset.y);
	}
} 

scr_draw_hitbox();