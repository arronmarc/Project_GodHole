image_xscale = 0.07;
image_yscale = 0.07;

spd=2 //set the speed
xx=x //"smooth" x position
yy=y//"smooth" y position
scr_shooter_ai_create(global.enemyfearmax) //initialise the shooter ai
assaulter=instance_number(red_obj) mod 2 //AI will be an assaulter on each even number.
in_cover = false;                        //Assaulters can charge the enemy

time_spawned = global.curSec;

//skeleton_skin_set("Enemy");
skeleton_skin_set("Default body");

SmoothAnimTrans()

skeleton_attachment_set("Weapon", "Gun")

hp = 5;
isDead = false;

w_spd = 1.2;
n_spd = 4;
r_spd = 8;
spd = w_spd;
moveX = 0;
moveY = 0;

animation_start_time = 0;
animation_playing = false;