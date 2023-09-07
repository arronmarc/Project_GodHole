// Step event

switch (state) {
    case States.HUNT:
	if (hp <= 0) {
	    state = States.DIE;
	} else {
            // Lerp the sprite's position.
            xx += (x - xx) * spd / 20;
            yy += (y - yy) * spd / 20;

            // Update direction
            if (xx < x) {
                image_xscale = -0.07;
            } else if (xx > x) {
                image_xscale = 0.07;
            }

            // Run the hunt script
            scr_zombie_hunt_step(obj_player, wall_obj, 0.8, 30, 250);

            // Check distance for lunging
            if (hasSpottedPlayer && point_distance(x, y, obj_player.x, obj_player.y) <= 30 && global.curSec - lastLeapTime >= 5) {
		        state = States.LUNGE;
		        lastLeapTime = global.curSec;
					}
				}
			break;

    case States.LUNGE:
        // Lunge logic here
        if (point_distance(x, y, obj_player.x, obj_player.y) > 30 || global.curSec - lastLeapTime >= 1) {
            state = States.HUNT;
        }
        break;

    case States.DIE:
        isDead = true;
        spd = 0;
        speed = 0;
        xx = 0;
        yy = 0;
        break;
}

