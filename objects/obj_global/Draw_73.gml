if (!global.debug_physics) return;

// Draw collision under cursor.
var mouse = new Pos(mouse_x, mouse_y);
var collision = scr_collision_pos(mouse);
scr_draw_box(collision.box, #FFFFFF);
scr_draw_text(new Pos(mouse.x + 2, mouse.y + 2), global.solidity_name[collision.target.solidity], #FFFFFF);

// Draw cursor.
draw_set_color(global.step % 4 < 2 ? #FFFFFF : #000000);
draw_point(mouse_x, mouse_y);
