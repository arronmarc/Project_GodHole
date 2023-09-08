if (instance_exists(my_light)) {
    with (my_light) {
        instance_destroy();
    }
}
