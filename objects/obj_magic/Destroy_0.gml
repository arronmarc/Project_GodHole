if (instance_exists(my_light)) {
    with (my_light) {
        instance_destroy();
    }
}
part_particles_clear(global.P_System);
part_emitter_clear(global.P_System, global.Emitter2);