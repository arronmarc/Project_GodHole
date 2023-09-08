// Animation Update Event of oTree

if (hp == 5 && !fallen) {
    fallen = true;
    vulnerable = false;  // Set the tree as invulnerable
    skeleton_animation_set("Fall", false);
} else if (hp > 5 && skeleton_animation_get() != "Wind sway") {
    skeleton_animation_set("Wind sway", true);
}
