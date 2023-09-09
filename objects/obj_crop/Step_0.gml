// Inherit parent behavior
event_inherited();

//obj_crop step event

if (fullyGrown) {
    // Make this object breakable
    hp = 1;
    
    // Dynamically set the res array based on cropType
    switch(cropType) {
        case crop.tomato:
            res = [INVITEMS.TOMATO];
            break;
        case crop.potato:
            res = [INVITEMS.POTATO];
            break;
        case crop.carrot:
            res = [INVITEMS.CARROT];
            break;
        case crop.artichoke:
            res = [INVITEMS.ARTICHOKE];
            break;
        case crop.chilli:
            res = [INVITEMS.CHILLI];
            break;
        case crop.gourd:
            res = [INVITEMS.GOURD];
            break;
        case crop.corn:
            res = [INVITEMS.CORN];
            break;
        default:
            res = [];
            break;
    }
}
else {
    // Make this object unbreakable if not fully grown
    hp = -1;
    res = [];
}



// Remove crop reference from grid if hp <= 0
if (hp <= 0) {
    var cs = crops.cellSize;
    var gx = x div cs;
    var gy = y div cs;
    var i_grid = crops.ds_crops_instances;
    i_grid[# gx, gy] = 0;
}
