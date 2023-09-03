function initItem(){

/// @arg item
/// @arg name
/// @arg sprite
/// @arg recipe
/// @arg <placeable>

var _item = argument[0];

global.itemName[_item] = argument[1];
global.itemSprite[_item] = argument[2];
global.itemRecipe[_item] = argument[3];

global.itemPlaceable[_item] = (argument_count > 4 ? argument[4] : noone);

}