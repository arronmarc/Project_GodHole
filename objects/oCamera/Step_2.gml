// End step event

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
targetX = camX;
targetY = camY;

// Zoom level
var focusZoom = 0.9; 

var panFactor = 1;  // Value between 0 and 1. Determines how quickly the camera pans towards the player as they approach the boundary.

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

if (mouse_check_button_released(mb_right)) 
{
    returning_to_player = true;
}

if (returning_to_player)
{
    // Smoothly return the camera to center on the player
    targetX = obj_player.x - RES_W/2;
    targetY = obj_player.y - RES_H/2;

    // Check if camera has nearly reached the player.
    if (abs(camX - targetX) < 5 && abs(camY - targetY) < 5)
    {
        returning_to_player = false;
    }
}
else if (mouse_check_button(mb_right))
{
    // Calculate a point that's halfway between the player and the crosshair
    targetX = (crosshair.x + obj_player.x) / 2 - RES_W/2;
    targetY = (crosshair.y + obj_player.y) / 2 - RES_H/2;
    targetW = RES_W * focusZoom;
    targetH = RES_H * focusZoom;
}

// Use lerp for smoother camera movement
var lerpSpeed = 0.05;  // Adjust this value for optimal smoothness
camX = lerp(camX, targetX, lerpSpeed);
camY = lerp(camY, targetY, lerpSpeed);

// Adjust camera size for zoom using lerp
camW = lerp(camW, targetW, CAM_SMOOTH);
camH = lerp(camH, targetH, CAM_SMOOTH);

// Clamp the camera to room bounds
camX = clamp(camX, 0, room_width - camW);
camY = clamp(camY, 0, room_height - camH);

// Apply camera position and size
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

// Store previous mouse position for future use
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);
