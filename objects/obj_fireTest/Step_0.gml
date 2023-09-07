var dif = choose(0.01,-0.01,0);
glowSize += dif;
glowSize = clamp(glowSize,0.9,1.1);

lifeTime -= 1;
if lifeTime <= 0 {
	instance_create_layer(x, y, "Instances", obj_fireTest_dead)
    instance_destroy();
    }

