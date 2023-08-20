///Draw End Event for objLightController

if (!global.isDay) {
    // Interpolation code remains unchanged
    var dayColor = c_white; 
    var nightColor = c_dkgray; 
  ///Draw End Event for objLightController

// Interpolation between day and night colors based on global.darkness
var interpolatedColor = make_color_rgb(
    lerp(color_get_red(dayColor), color_get_red(nightColor), global.darkness),
    lerp(color_get_green(dayColor), color_get_green(nightColor), global.darkness),
    lerp(color_get_blue(dayColor), color_get_blue(nightColor), global.darkness)
);

// If it's approaching daylight, adjust the influence of our renderer.
if (global.darkness <= 0.2) {
    // As darkness approaches 0, this color will be closer to dayColor, effectively reducing the influence of our renderer
    var fadeColor = make_color_rgb(
        lerp(color_get_red(dayColor), color_get_red(interpolatedColor), global.darkness / 0.2),
        lerp(color_get_green(dayColor), color_get_green(interpolatedColor), global.darkness / 0.2),
        lerp(color_get_blue(dayColor), color_get_blue(interpolatedColor), global.darkness / 0.2)
    );
    renderer.SetAmbientColor(fadeColor);
} else {
    renderer.SetAmbientColor(interpolatedColor);
}

// Update and draw the renderer
renderer.Update(0, 0, room_width, room_height);
renderer.Draw(0, 0);

}
