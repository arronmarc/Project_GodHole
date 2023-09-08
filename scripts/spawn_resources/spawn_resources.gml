/// @function spawn_resources()
/// @description Spawns resources based on the res array and the count.

function spawn_resources() {
    // How many resources to create
    var _resCount = choose(1,1,1,1,2,2,3);
    if (resCount != -1) _resCount = resCount;  // Ensure resCount is defined elsewhere

    var _resMax = array_length(res);

    // Create resources
    repeat (_resCount) {
        // Get random resource
        var _resID = irandom(_resMax - 1);

        var _res = res[_resID];

        // Item position
        var _x = x + irandom_range(-4, 4);
        var _y = y + irandom_range(-4, 4);

        // Create oItem
        var _inst = instance_create_layer(_x, _y, "Instances", oItem);

        // Set item properties
        with (_inst) {
            type = _res;
            sprite_index = global.itemSprite[_res];
            z = -other.sprite_height / 2;
        }
    }
}
