
/// @description Convert the hitbox of the provided instance to an axis-aligned box.
function scr_instance_box(instance = self) {
	return new Box(instance.bbox_left, instance.bbox_top, instance.bbox_right, instance.bbox_bottom);
}