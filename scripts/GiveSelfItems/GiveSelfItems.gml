function GiveSelfItems(){
    var items = [
        INVITEMS.APPLE,
        INVITEMS.ORANGE,
        INVITEMS.WOOD,
        INVITEMS.STONE,
        INVITEMS.IRON,
        INVITEMS.BLOCK_WOOD,
        INVITEMS.BLOCK_IRON,
        INVITEMS.BLOCK_WALL,
		INVITEMS.WOODEN_CHEST,
		INVITEMS.WOODEN_CHEST_LARGE,
		INVITEMS.POTION,
		INVITEMS.SYRUP
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
