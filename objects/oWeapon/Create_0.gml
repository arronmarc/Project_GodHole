//unarmed
weapons[0] = ds_map_create();
ds_map_add(weapons[0],"sprite",-1);
ds_map_add(weapons[0],"recoil",0);
ds_map_add(weapons[0],"recoil_push",0);
ds_map_add(weapons[0],"damage",0);
ds_map_add(weapons[0],"projectile",-1);
ds_map_add(weapons[0],"startup",0);
ds_map_add(weapons[0],"length",0);
ds_map_add(weapons[0],"cooldown",0);
ds_map_add(weapons[0],"bulletspeed",0);
ds_map_add(weapons[0],"automatic",false);

//AR
weapons[1] = ds_map_create();
ds_map_add(weapons[1],"sprite",sWP_AR);
ds_map_add(weapons[1],"recoil",8);
ds_map_add(weapons[1],"recoil_push",8);
ds_map_add(weapons[1],"damage",1);
ds_map_add(weapons[1],"projectile",oHitscan);
ds_map_add(weapons[1],"startup",0);
ds_map_add(weapons[1],"length",60);
ds_map_add(weapons[1],"cooldown",0.4);
ds_map_add(weapons[1],"bulletspeed",40);
ds_map_add(weapons[1],"automatic",false);

//Plasma
weapons[2] = ds_map_create();
ds_map_add(weapons[2],"sprite",sWP_Plasma);
ds_map_add(weapons[2],"recoil",8);
ds_map_add(weapons[2],"recoil_push",8);
ds_map_add(weapons[2],"damage",3);
ds_map_add(weapons[2],"projectile",oBullet);
ds_map_add(weapons[2],"startup",0);
ds_map_add(weapons[2],"length",60);
ds_map_add(weapons[2],"cooldown",5);
ds_map_add(weapons[2],"bulletspeed",40);
ds_map_add(weapons[2],"automatic",true);


weapon = 0;
ammo[array_length_1d(weapons)-1] = 0;
ammo[0] = -1;

ChangeWeapon(0);

//Current cooldown
current_cd = 0;
current_delay = 0;
current_recoil = 0;

_x = x;
_imgAngle = image_angle;
curvePos = 0;
curveSpd = 0;


