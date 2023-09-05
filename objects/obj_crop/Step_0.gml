// Inherit parent behavior
event_inherited();

if (fullyGrown) {
    // Make this object breakable
    hp = 1;
    
    // Dynamically set the res array based on cropType
    switch(cropType) {
        case crop.tomato:
            res = [ITEM.TOMATO];
            break;
        case crop.potato:
            res = [ITEM.POTATO];
            break;
        case crop.carrot:
            res = [ITEM.CARROT];
            break;
        case crop.artichoke:
            res = [ITEM.ARTICHOKE];
            break;
        case crop.chilli:
            res = [ITEM.CHILLI];
            break;
        case crop.gourd:
            res = [ITEM.GOURD];
            break;
        case crop.corn:
            res = [ITEM.CORN];
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
