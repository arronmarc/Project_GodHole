// On the end of any animation event
if (skeleton_animation_get() == "Fall") {
    animationHasPlayed = true;
    vulnerable = true;  // Set the tree as vulnerable again
}
