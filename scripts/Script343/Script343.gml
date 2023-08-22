function any_gamepad_button_pressed(){

for (var i = gp_face1; i <= gp_padd; i++) {
        if (gamepad_button_check(0, i)) return true;
    }
    return false;

}