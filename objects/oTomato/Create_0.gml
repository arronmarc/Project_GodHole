//Create event
event_inherited();

res = [INVITEMS.TOMATO, INVITEMS.TOMATO_SEED];

hp = 1;
hpMax = hp;

frameWidth = 32;
frameHeight = 64;

daysOld = 0;
growthStage = 0;
growthStageDuration = 1;
maxGrowthStage = (sprite_get_width(spr_crops)/frameWidth)-1;

fullyGrown = false;
sparkle = -1;

xx = x-(frameWidth/2)+2;
yy = y-frameHeight+6;

initialDraw = false;
