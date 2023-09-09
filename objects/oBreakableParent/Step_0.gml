// oBreakableParent Step Event

if (object_index == oTree) {
    // If the tree's HP reaches 5 and hasn't fallen yet
    if (hp == 5 && !fallen) {
        fallen = true;
    }
}

// Handling the resource spawning and destruction
if (hp == 0 && object_index == obj_crop && !fullyGrown) {
    // Do nothing, the crop isn't ready to be harvested.
} else if (hp == 0) {
    spawn_resources();
    instance_destroy();
}

if (flashAlpha > 0) {
	flashAlpha -= 0.1;
}