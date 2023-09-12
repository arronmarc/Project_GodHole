/// @arg item
/// @arg name
/// @arg sprite
/// @arg recipe
/// @arg <placeable>
/// @arg <stackSize>
/// @arg <description>
function initItem(_item, _name, _sprite, _recipe, _placeable, _stackSize, _description = ""){
    global.itemName[_item] = _name;
    global.itemSprite[_item] = _sprite;
    global.itemRecipe[_item] = _recipe;
    global.itemPlaceable[_item] = (_placeable != undefined ? _placeable : noone);
    global.itemStackSize[_item] = (_stackSize != undefined ? _stackSize : 64);
    
    // Add this line to store the description:
    global.itemDescription[_item] = _description;
}
