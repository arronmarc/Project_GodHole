function init(){
global.enemyfearmax = 100;
gml_pragma("global", "init()");

#macro PLACING_GRID_SIZE 16

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
	
	initItem(ITEM.POTION, "Potion", sPotion, [
		[ITEM.APPLE, 2]
	]);
	initItem(ITEM.SYRUP, "Syrup", sSyrup, [
		[ITEM.ORANGE, 1],
		[ITEM.APPLE, 1]
	]);
	initItem(ITEM.BLOCK_WOOD, "Wood Block", sBlock_Wood, [
		[ITEM.WOOD, 2]
	], oWoodBlock);
	initItem(ITEM.BLOCK_IRON, "Iron Block", sBlock_Iron, [
	[ITEM.IRON, 2]
	], oIronBlock);
	

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