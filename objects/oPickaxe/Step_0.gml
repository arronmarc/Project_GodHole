rotation = lerp(rotation, 45, 0.1);

image_angle = rotation * obj_player.image_xscale;

var _mousePress = input_check("shoot");

var _breakable = instance_position(mouse_x, mouse_y, oBreakableParent);

with (_breakable) {
	
	var _dist = distance_to_object(obj_player);
	
	if (_dist < other.breakDistance) {
		if (other.cooldown == 0 && _mousePress) {
			hp--;
			other.rotation = -80;
			other.cooldown = 20;
		}
	}
}
if (cooldown > 0) cooldown--;
