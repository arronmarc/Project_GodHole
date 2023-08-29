//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/8
yy+=(y-yy)*spd/8

//spawning teammates
if fear<fear_max/2 && instance_number(red_obj)<4 && !instance_exists(drone)
{
    repeat(3)
    instance_create(irandom(room_width),-30,red_obj)
    fear=fear_max
}

if instance_exists(obj_player) //if enemy exists then run the shooter AI
{

    scr_find_target(obj_player,blue_bullet,wall_obj)  //choose the target enemy
    
    scr_shooter_ai_step(var_target_enemy,wall_obj,spd,assaulter,blue_bullet) //run shooter ai

    if can_shoot=1
    scr_shoot(red_bullet,9,point_direction(x,y,var_target_enemy.x,var_target_enemy.y)+irandom_range(-10,10)) //shoot if allowed!

}


if (global.pause) {
    image_speed = 0;
    return; // Exit the function early since the game is paused.
}
else {
    image_speed = 1; // Resume the animation. Adjust this value if your standard playback speed is different.
}

if (!global.pause) 
{
	#region Movement and animations
	// Determine direction based on "smooth" x position
	if (xx < x) {
	    image_xscale = 0.07;  // Facing right
	} else if (xx > x) {
	    image_xscale = -0.07;  // Facing left
	}


    // Check for the death condition first.
if (in_cover) {
    if (skeleton_animation_get() != "Crouch") {
        skeleton_animation_set("Crouch");
    }
} else if (hp <= 0) {
		alarm[0] = -1;
        if (skeleton_animation_get() != "Die") {
            skeleton_animation_set("Die", false);
            spd = 0;
            animation_start_time = current_time;
            animation_playing = true;
        }
		alarm[0] = -1;
    } 
    else if (spd) {
        // Only set walking animation if the character is not dying.
        if skeleton_animation_get() != "Walk" {
            skeleton_animation_set("Walk");
        }
    } 
    else {
        // Only set idle animation if the character is not dying.
        if skeleton_animation_get() != "Idle" {
            skeleton_animation_set("Idle");
        }
    }

    if (animation_playing) {
        var duration = 40 / 30; 
        if (current_time - animation_start_time >= duration * 1000) { // Multiply by 1000 because current_time is in milliseconds
            // Here, the character is already dead, so you don't need to set any other animation.
            animation_playing = false; // Stop tracking the animation
        }
    }

    // Check for collisions
    CollisionCheck(moveX, moveY);

	#endregion

}
