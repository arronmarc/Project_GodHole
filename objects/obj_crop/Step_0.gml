// If crop is not fully grown, do not proceed
if (!fullyGrown || array_length(res) == 0) exit;

// Inherit parent behavior
event_inherited();

// Remove crop reference from grid if hp <= 0
if (hp <= 0) {
    var cs = crops.cellSize;
    var gx = x div cs;
    var gy = y div cs;
    var i_grid = crops.ds_crops_instances;
    i_grid[# gx, gy] = 0;
}
