direction = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
aim = point_direction(x, y, crosshair.x, crosshair.y);
global.mana --;

my_light = instance_create_layer(x, y, "Instances", oBulletLight);

emitterFire = part_emitter_create(oParticleFire.particleSystem);
emitterFireOutline = part_emitter_create(oParticleFire.particleSystemBelow);
