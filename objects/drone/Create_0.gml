image_xscale = 0.07;
image_yscale = 0.07;

xx=x
yy=y
gamemode=0
b=0
spd=0.8
scan_dir=0
look_dir=0
searchx=x
searchy=y
seenx=x
seeny=y
state=0
col=make_color_rgb(196,207,160)
col_look=make_color_rgb(77,83,60)
col_alert=make_color_rgb(31,31,31)

//skeleton_skin_set("Enemy");
skeleton_skin_set("Default body");

SmoothAnimTrans()

hp = 5;

w_spd = 1.2;
n_spd = 4;
r_spd = 8;
spd = w_spd;
moveX = 0;
moveY = 0;

animation_start_time = 0;
animation_playing = false;

