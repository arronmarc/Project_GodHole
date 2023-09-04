if ((isDead != true) and  (!global.pause)) {

//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/20
yy+=(y-yy)*spd/20


// Determine direction based on "smooth" x position
if (xx < x) {
    image_xscale = 0.07;  // Facing right
} else if (xx > x) {
    image_xscale = -0.07;  // Facing left
}

if ((gamemode == 0)) { //patrolling drones mode
        scr_zombie_hunt_step(obj_player, wall_obj, 0.8, 30, 250);  //run the hunt script
    }
    else
    {
        move_towards_point(x, -50, 3);
    }

}

//Die
if (animation_playing) {
    var duration = 40 / 30; 
    if (current_time - animation_start_time >= duration * 1000) {
        animation_playing = false; // Stop tracking the animation
    }
}
	
if (hp == 0) {
		isDead = true;
        isFollowing = false;
        spd = 0;
        animation_start_time = current_time;
        animation_playing = true;      
}