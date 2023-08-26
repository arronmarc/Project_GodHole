x = obj_player.x;
y = obj_player.y;
light.x = x;
light.y = y-30;

if (daycycle.draw_daylight == true) {
    if (!light_created) {
        light = new BulbLight(objLightController.renderer, sprLightPlayer, 0, x, y);
        light.AddToRenderer(objLightController.renderer);
        light_created = true;  // Set the flag to true, so the light won't be recreated
    }
}
