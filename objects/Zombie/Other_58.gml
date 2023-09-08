// Animation update event

switch (state) {
    case States.HUNT:
        if (skeleton_animation_get() != "Walk") {
            skeleton_animation_set("Walk");
        }
        break;

    case States.LUNGE:
        if (skeleton_animation_get() != "Lunge") {
            skeleton_animation_set("Lunge", false);
        }
        break;

    case States.DIE:
        if (skeleton_animation_get() != "Die") {
            skeleton_animation_set("Die", false);
        }
        break;
}

// Handle directional facing
if (!isDead) {
	if (obj_player.x < x) {
	    image_xscale = -0.07;
	} else {
	    image_xscale = 0.07;
	}
}

