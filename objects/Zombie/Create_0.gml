skeleton_animation_mix("Walk", "Lunge", 0.3);
skeleton_animation_mix("Lunge", "Walk", 0.3);

image_xscale = -0.07;
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

isDead = false;
hp = 5;


enum States {
    HUNT,
    LUNGE,
    DIE
}

state = States.HUNT;
lastLeapTime = -5;
hasSpottedPlayer = false;
