function init(){
global.enemyfearmax = 100;
gml_pragma("global", "init()");

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

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
	BLOCK_IRON,
	
	TOMATO_SEED,
    TOMATO,
        
    POTATO_SEED,
    POTATO,
        
    CARROT_SEED,
    CARROT,
        
    ARTICHOKE_SEED,
    ARTICHOKE,
        
    CHILLI_SEED,
    CHILLI,
        
    GOURD_SEED,
    GOURD,
        
    CORN_SEED,
    CORN
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
	
	initItem(ITEM.TOMATO_SEED, "Tomato Seed", sTomatoSeed, []);
    initItem(ITEM.TOMATO, "Tomato", sTomato, []);
    
    initItem(ITEM.POTATO_SEED, "Potato Seed", sPotatoSeed, []);
    initItem(ITEM.POTATO, "Potato", sPotato, []);
    
    initItem(ITEM.CARROT_SEED, "Carrot Seed", sCarrotSeed, []);
    initItem(ITEM.CARROT, "Carrot", sCarrot, []);
    
    initItem(ITEM.ARTICHOKE_SEED, "Artichoke Seed", sArtichokeSeed, []);
    initItem(ITEM.ARTICHOKE, "Artichoke", sArtichoke, []);
    
    initItem(ITEM.CHILLI_SEED, "Chilli Seed", sChilliSeed, []);
    initItem(ITEM.CHILLI, "Chilli", sChilli, []);
    
    initItem(ITEM.GOURD_SEED, "Gourd Seed", sGourdSeed, []);
    initItem(ITEM.GOURD, "Gourd", sGourd, []);
    
    initItem(ITEM.CORN_SEED, "Corn Seed", sCornSeed, []);
    initItem(ITEM.CORN, "Corn", sCorn, []);
	

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