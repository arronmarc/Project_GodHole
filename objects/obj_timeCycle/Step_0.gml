script_execute(scr_timeCycle_step,0,0,0,0,0);

if (input_check_pressed("light")) {
    light_active = !light_active;  // Toggle the light state
}