function init(){
gml_pragma("global", "init()");

global.itemDescription = ds_map_create();

#macro TRANSITION_SPEED 0.02
#macro OUTT 0
#macro INN 1

#macro INV_SIZE 30

#macro PLACING_GRID_SIZE 16

//Items
enum INVITEMS {
	APPLE,
	ORANGE,
	WOOD,
	STONE,
	IRON,
	
	POTION,
	SYRUP,
	BLOCK_WOOD,
	BLOCK_IRON,
	BLOCK_WALL,
	WOODEN_CHEST,
	WOODEN_CHEST_LARGE,
	
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
	
	initItem(INVITEMS.APPLE, "Apple", sApple, [], undefined, 64, "A delicious red apple.");
	initItem(INVITEMS.ORANGE, "Orange", sOrange, [], undefined, 64, "A juicy orange fruit.");

	initItem(INVITEMS.WOOD, "Wood", sWood, [], undefined, 64);
	
	initItem(INVITEMS.STONE, "Stone", sStone, [], undefined, 64);
	initItem(INVITEMS.IRON, "Iron", sIron, [], undefined, 64);
	
	initItem(INVITEMS.POTION, "Potion", sPotion, [
		[INVITEMS.APPLE, 2]
	], undefined, 64, "Restores 20 health.");
	initItem(INVITEMS.SYRUP, "Syrup", sSyrup, [
		[INVITEMS.ORANGE, 1],
		[INVITEMS.APPLE, 1]
	], undefined, 64, "Restores 20 mana.");
	initItem(INVITEMS.BLOCK_WOOD, "Wood Block", sBlock_Wood, [
		[INVITEMS.WOOD, 2]
	], oWoodBlock, 64, "A wood wall.");
	
	initItem(INVITEMS.BLOCK_IRON, "Iron Block", sBlock_Iron, [
	[INVITEMS.IRON, 2]
	], oIronBlock, 64, "An iron wall.");
	
	initItem(INVITEMS.BLOCK_WALL, "Wall Block", sBlock_Wall, [
	[INVITEMS.STONE, 2]
	], wall_obj,64, "A stone wall.");
	
	initItem(INVITEMS.WOODEN_CHEST, "Wooden Chest", sWoodenChest, [
	[INVITEMS.WOOD, 3]
	], oWoodenChest, 64, "Wooden chest with 8 slots.");
	
	initItem(INVITEMS.WOODEN_CHEST_LARGE, "Large Wooden Chest", sWoodenChestLarge, [
	[INVITEMS.WOOD, 6]
	], oWoodenChestLarge, 64, "Wooden chest with 12 slots.");
	
	initItem(INVITEMS.TOMATO_SEED, "Tomato Seed", sTomatoSeed, [], oTomato, 64);
    initItem(INVITEMS.TOMATO, "Tomato", sTomato, [], undefined, 64);
    
    initItem(INVITEMS.POTATO_SEED, "Potato Seed", sPotatoSeed, []);
    initItem(INVITEMS.POTATO, "Potato", sPotato, [], undefined, 64);
    
    initItem(INVITEMS.CARROT_SEED, "Carrot Seed", sCarrotSeed, [], oCarrot, 64);
    initItem(INVITEMS.CARROT, "Carrot", sCarrot, [], undefined, 64);
    
    initItem(INVITEMS.ARTICHOKE_SEED, "Artichoke Seed", sArtichokeSeed, []);
    initItem(INVITEMS.ARTICHOKE, "Artichoke", sArtichoke, [], undefined, 64);
    
    initItem(INVITEMS.CHILLI_SEED, "Chilli Seed", sChilliSeed, []);
    initItem(INVITEMS.CHILLI, "Chilli", sChilli, [], undefined, 64);
    
    initItem(INVITEMS.GOURD_SEED, "Gourd Seed", sGourdSeed, []);
    initItem(INVITEMS.GOURD, "Gourd", sGourd, [], undefined, 64);
    
    initItem(INVITEMS.CORN_SEED, "Corn Seed", sCornSeed, []);
    initItem(INVITEMS.CORN, "Corn", sCorn, [], undefined, 64);
	

//Crafting menu
global.craftingMenu = [
"Stats",
INVITEMS.POTION,
INVITEMS.SYRUP,

"Building",
INVITEMS.BLOCK_WOOD,
INVITEMS.BLOCK_IRON,
INVITEMS.BLOCK_WALL,

"Chests",
INVITEMS.WOODEN_CHEST,
INVITEMS.WOODEN_CHEST_LARGE

];

}