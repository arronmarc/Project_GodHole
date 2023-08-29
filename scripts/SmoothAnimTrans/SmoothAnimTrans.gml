function SmoothAnimTrans(){

// Define an array with the animations
var animations = ["Idle", "Walk", "Run", "Jump backwards", "Die", "Crouch", "Crouch idle", "Roll", "Sword stab"];

// Loop through all the animations
for (var i = 0; i < array_length(animations); ++i) {
    for (var j = 0; j < array_length(animations); ++j) {
        if (i != j) {
            skeleton_animation_mix(animations[i], animations[j], 0.08);
        }
    }
}

}