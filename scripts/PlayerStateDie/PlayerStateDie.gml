function PlayerStateDie() {



    if skeleton_animation_get() != "Die" {
        skeleton_animation_set("Die", true); // Initially, let it play
    }
    moveX = 0;
    moveY = 0;




}
