// Inherit the parent event
event_inherited();

//Resources
res = [ITEM.APPLE, ITEM.ORANGE];

hp = 1;
hpMax = hp;



frameWidth = 32;
frameHeight = 64;

cropType = 0;
daysOld = 0;
growthStage = 0;
growthStageDuration = 0;
maxGrowthStage = (sprite_get_width(spr_crops)/frameWidth)-1;

fullyGrown = false;
sparkle = -1;

xx = x-(frameWidth/2)+2;
yy = y-frameHeight+6;



// Ffunction to return resources based on crop type
function getCropResources(_cropType) {
    switch(_cropType) {
        case crop.tomato:
            return [ITEM.TOMATO];
        case crop.potato:
            return [ITEM.POTATO];
        case crop.carrot:
            return [ITEM.CARROT];
        case crop.artichoke:
            return [ITEM.ARTICHOKE];
        case crop.chilli:
            return [ITEM.CHILLI];
        case crop.gourd:
            return [ITEM.GOURD];
        case crop.corn:
            return [ITEM.CORN];
        default:
            return [];
    }
}

res = getCropResources(cropType);
