function init(){

gml_pragma("global", "init()");


//Items
enum ITEM {
	APPLE,
	ORANGE,
	WOOD,
	STONE,
	IRON,
	
	POTION,
	SYRUP,
	BLOCK_WOOD,
	BLOCK_IRON
	}
	
	initItem(ITEM.APPLE, "Apple", sApple, []);
	initItem(ITEM.ORANGE, "Orange", sOrange, []);
	initItem(ITEM.WOOD, "Wood", sWood, []);
	
	initItem(ITEM.STONE, "Stone", sStone, []);
	initItem(ITEM.IRON, "Iron", sIron, []);
	
	initItem(ITEM.POTION, "Potion", sPotion, []);
	initItem(ITEM.SYRUP, "Syrup", sSyrup, []);
	initItem(ITEM.BLOCK_WOOD, "Wood Block", sBlock_Wood, []);
	initItem(ITEM.BLOCK_IRON, "Iron Block", sBlock_Iron, []);
	

//Inventory
#macro INV_SIZE 12

//Crafting menu
global.craftingMenu = [
"CRAFTING",
"Stats",
ITEM.POTION,
ITEM.SYRUP,

"Building",
ITEM.BLOCK_WOOD,
ITEM.BLOCK_IRON

];

}