function GiveSelfItems(){
    var items = [
		INVITEMS.WEAPON_AR,
		INVITEMS.WEAPON_RIFLE,
		INVITEMS.WEAPON_SHOTGUN,
        INVITEMS.APPLE,
        INVITEMS.ORANGE,
        INVITEMS.IRON,
    ];

    for(var i = 0; i < array_length_1d(items); i++) {
        var _item = items[i];
        var _count = 2;  // Assuming you want 2 of each item
        var _stackSize = global.itemStackSize[_item];

        while(_count > 0) {
            inv_add(_item, min(_stackSize, _count));
            _count -= _stackSize;
        }
    }
}
