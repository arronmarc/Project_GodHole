//fear control - in order to work with the shooter AI
scr_fear_control(red_bullet)
fear-=1

//spawning teammates
if fear<=1 && instance_number(blue_obj)<5 && !instance_exists(drone)
instance_create(irandom(room_width),room_height+30,blue_obj)

//formation
var i;
for (i=0; i<instance_number(blue_obj); i+=1)
{
    var blue=instance_find(blue_obj,i);
    blue.fx = 30* (i div 3)
    blue.fy = 50* (i mod 3)
}

