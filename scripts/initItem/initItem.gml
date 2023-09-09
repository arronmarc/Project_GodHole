/// @arg item
/// @arg name
/// @arg sprite
/// @arg recipe
/// @arg <placeable>
/// @arg <stackSize>
function initItem(_item, _name, _sprite, _recipe, _placeable, _stackSize){
global.itemName[_item] = _name;
global.itemSprite[_item] = _sprite;
global.itemRecipe[_item] = _recipe;

global.itemPlaceable[_item] = (_placeable != undefined ? _placeable : noone);
global.itemStackSize[_item] = (_stackSize != undefined ? _stackSize : 64);
}