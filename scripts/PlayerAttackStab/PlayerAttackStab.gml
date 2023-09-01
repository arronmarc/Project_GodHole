function PlayerAttackStab() {
    if (!global.pause) {
        if (rollTimer == 0) {
            // Initialize the attack
            skeleton_animation_set("Sword stab");  // Assuming "Attack" is your animation
            rollTimer = 14;  // Set the timer
        }

        // Decrement the timer
        rollTimer -= 1;

        if (rollTimer <= 0) {
            state = PlayerStateFree;  // Return to the free state
        }
    }
}
