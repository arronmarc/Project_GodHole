if (isDead != true)  {

//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/8
yy+=(y-yy)*spd/8

//spawning teammates
if fear<fear_max/2 && instance_number(red_obj)<4 && !instance_exists(drone)
{
    repeat(3)
	instance_create_layer(random(room_width), -30, "Instances", red_obj)
    fear=fear_max
}

if instance_exists(obj_player) //if enemy exists then run the shooter AI
{

    scr_find_target(obj_player,blue_bullet,wall_obj)  //choose the target enemy
    
    scr_shooter_ai_step(var_target_enemy,wall_obj,spd,assaulter,blue_bullet) //run shooter ai

if (global.curSec - time_spawned >= 5) {
    if (can_shoot = 1) {
			scr_shoot(oBulletEnemy,20,point_direction(x,y,var_target_enemy.x,var_target_enemy.y)+irandom_range(-2,2), point_direction(x,y,var_target_enemy.x,var_target_enemy.y)); //shoot if allowed!
		}
	}
}

// Determine direction based on "smooth" x position
if (xx < x) and (isDead != true) {
	image_xscale = 0.07;  // Facing right
} else if (xx > x) {
	image_xscale = -0.07;  // Facing left
}

	
}

//Die
if (animation_playing) {
    var duration = 40 / 30; 
    if (current_time - animation_start_time >= duration * 1000) { // Multiply by 1000 because current_time is in milliseconds
        // Here, the character is already dead, so you don't need to set any other animation.
        animation_playing = false; // Stop tracking the animation
    }
}
	
if (hp == 0) {
	isDead = true;
    spd = 0;
    animation_start_time = current_time;
    animation_playing = true;        
}