// oCamera end step event

if (!global.pause) {
// Get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

var innerBound = 250; // This is the distance from the actual boundary where the camera will start moving
var leftBound = camX + innerBound;
var rightBound = camX + camW - innerBound;
var topBound = camY + innerBound;
var bottomBound = camY + camH - innerBound;

// Variables for target camera size and position
var targetW = RES_W;
var targetH = RES_H;

// Default target is the current camera position
var targetX = camX;
var targetY = camY;

// Zoom level
var focusZoom = 1; 

var panFactor = 1;  // Value between 0 and 1. Determines how quickly the camera pans towards the player as they approach the boundary.

// Default behavior
if (!input_check("aim")) 
{
    // Camera follows the player by default
    targetX = obj_player.x - RES_W/2;
    targetY = obj_player.y - RES_H/2;

    crosshair.visible = false;  // Hide crosshair
}
else 
{
	crosshair.visible = true;   // Show crosshair

    // Control the crosshair's position with the right thumbstick
    var aimSpeedFactor = 50; // Adjust this for speed. Lower is slower.
    var aimX = gamepad_axis_value(0, gp_axisrh);
    var aimY = gamepad_axis_value(0, gp_axisrv);
    
    if (abs(aimX) > 0.2 || abs(aimY) > 0.2) {
        crosshair.x += aimX * aimSpeedFactor;
        crosshair.y += aimY * aimSpeedFactor;
    }
    
    // Keep the crosshair within a specific range from the player for better control
    var maxDist = RES_W / 1;  // This can be adjusted to your liking.
    var distance = point_distance(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
    
    if (distance > maxDist) {
        var dir = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
        crosshair.x = obj_player.x + lengthdir_x(maxDist, dir);
        crosshair.y = obj_player.y + lengthdir_y(maxDist, dir);
    }

    // Camera targets a point between the player and the crosshair
    targetX = (crosshair.x + obj_player.x) / 2 - RES_W/2;
    targetY = (crosshair.y + obj_player.y) / 2 - RES_H/2;
    targetW = RES_W * focusZoom;
    targetH = RES_H * focusZoom;
}

// Boundary checks for the camera movement
if (obj_player.x < leftBound)
{
    targetX -= (leftBound - obj_player.x) * panFactor;
}
else if (obj_player.x > rightBound)
{
    targetX += (obj_player.x - rightBound) * panFactor;
}

if (obj_player.y < topBound)
{
    targetY -= (topBound - obj_player.y) * panFactor;
}
else if (obj_player.y > bottomBound)
{
    targetY += (obj_player.y - bottomBound) * panFactor;
}

// Lerp and other functions to smoothen the camera movement
    var lerpSpeed = 0.05; 
    camX = lerp(camX, targetX, lerpSpeed);
    camY = lerp(camY, targetY, lerpSpeed);

    // Clamp the camera to room bounds
    camX = clamp(camX, 0, room_width - camW);
    camY = clamp(camY, 0, room_height - camH);

    // Apply screenshake if needed (keep it only once in the code, so removing the second occurrence)
    if (shakeRemain > 0) {
        var dir = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y) + 180; // Opposite direction of mouse
        var recoilX = lengthdir_x(shakeRemain, dir);
        var recoilY = lengthdir_y(shakeRemain, dir);
        camX += recoilX;
        camY += recoilY;
        shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));
    }

    // Clamp the camera position to room bounds
    camX = clamp(camX, 0, room_width - camW);
    camY = clamp(camY, 0, room_height - camH);

    // Apply camera position and size after all calculations and clamping
    camera_set_view_pos(camera, camX, camY);
    camera_set_view_size(camera, camW, camH);


}

/* Code with camera zooming

// Lerp and other functions to smoothen the camera movement
var lerpSpeed = 0.05; 
camX = lerp(camX, targetX, lerpSpeed);
camY = lerp(camY, targetY, lerpSpeed);
camW = lerp(camW, targetW, CAM_SMOOTH);
camH = lerp(camH, targetH, CAM_SMOOTH);

// Clamp the camera to room bounds
camX = clamp(camX, 0, room_width - camW);
camY = clamp(camY, 0, room_height - camH);

// Apply screenshake if needed
if (shakeRemain > 0) {
    var dir = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y) + 180; // Opposite direction of mouse
        var recoilX = lengthdir_x(shakeRemain, dir);
		var recoilY = lengthdir_y(shakeRemain, dir);
        camX += recoilX;
		camY += recoilY;
    shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));
}



#region Zooming
var initialZoom = currentZoom;

if (mouse_wheel_up()) {
    currentZoom -= 0.1;
    currentZoom = clamp(currentZoom, 0.1, 2.0);
}
else if (mouse_wheel_down()) {
    currentZoom += 0.1;
    currentZoom = clamp(currentZoom, 0.1, 2.0);
}

// Clamp the zoom level to a reasonable range
currentZoom = clamp(currentZoom, 0.1, 2.0); // Adjust the range as needed

var zoomChange = currentZoom - initialZoom;

// Adjust the target position based on zoom change
targetX -= (zoomChange * RES_W / 2);
targetY -= (zoomChange * RES_H / 2);

if (currentZoom > initialZoom) {
    // If zooming in, ensure the target position stays centered on the player
    targetX = obj_player.x - RES_W / 2;
    targetY = obj_player.y - RES_H / 2;
}

// Lerp and other functions to smoothen the camera movement
camX = lerp(camX, targetX, lerpSpeed);
camY = lerp(camY, targetY, lerpSpeed);

targetW = RES_W * focusZoom * currentZoom;
targetH = RES_H * focusZoom * currentZoom;

camW = lerp(camW, targetW, CAM_SMOOTH);
camH = lerp(camH, targetH, CAM_SMOOTH);

// Calculate camera position and size before clamping
var newCamX = camX;
var newCamY = camY;
var newCamW = camW;
var newCamH = camH;

#endregion



// Apply screenshake if needed
if (shakeRemain > 0) {
    var dir = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y) + 180; // Opposite direction of mouse
    var recoilX = lengthdir_x(shakeRemain, dir);
    var recoilY = lengthdir_y(shakeRemain, dir);
    newCamX += recoilX;
    newCamY += recoilY;
    shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));
}

// Clamp the camera position to room bounds
newCamX = clamp(newCamX, 0, room_width - newCamW);
newCamY = clamp(newCamY, 0, room_height - newCamH);

// Apply camera position and size after all calculations and clamping
camera_set_view_pos(camera, newCamX, newCamY);
camera_set_view_size(camera, newCamW, newCamH);
*/