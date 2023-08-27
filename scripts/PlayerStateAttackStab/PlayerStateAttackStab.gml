function PlayerStateAttackStab() {
	if input_check_pressed("attack"){
    if skeleton_animation_get() != "Sword stab" {
        skeleton_animation_set("Sword stab", true); 
    }
	}
}
