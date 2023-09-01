if ((isDead != true) and  (!global.pause)) {

//lerp the sprite's position. Adjust the divider for more or less smoothing.
xx+=(x-xx)*spd/20
yy+=(y-yy)*spd/20

if ((gamemode = 0)) { //patrolling drones mode
    scr_hunt_step(obj_player,wall_obj,0.6,30,250)  //run the hunt script
    
    if (state = 1) { //spawn enemies if in the alert state
        if instance_number(red_obj)<3
        {
            var spawndir=point_direction(obj_player.x,obj_player.y,x,y)+irandom_range(-45,45)
            instance_create(room_width/2+lengthdir_x(500,spawndir),room_height/2+lengthdir_y(500,spawndir),red_obj)
        }   
    }

}
else   //all out war mode!
{
    move_towards_point(x,-50,3)
    if yy<-30
    {
        instance_create(random(room_width),-50,red_obj)
        instance_destroy()
    }
}


if (global.pause) {
    image_speed = 0;
    return; // Exit the function early since the game is paused.
}
else {
    image_speed = 1; // Resume the animation. Adjust this value if your standard playback speed is different.
}

if (isDead != true) and  (!global.pause) 
{
	// Determine direction based on "smooth" x position
	if (xx < x) {
	    image_xscale = 0.07;  // Facing right
	} else if (xx > x) {
	    image_xscale = -0.07;  // Facing left
	}


    
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