function init(){
global.enemyfearmax = 100;
gml_pragma("global", "init()");

#macro TRANSITION_SPEED 0.02
#macro OUTT 0
#macro INN 1

#macro INV_SIZE 12

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
	
	initItem(INVITEMS.APPLE, "Apple", sApple, []);
	initItem(INVITEMS.ORANGE, "Orange", sOrange, []);
	initItem(INVITEMS.WOOD, "Wood", sWood, []);
	
	initItem(INVITEMS.STONE, "Stone", sStone, []);
	initItem(INVITEMS.IRON, "Iron", sIron, []);
	
	initItem(INVITEMS.POTION, "Potion", sPotion, [
		[INVITEMS.APPLE, 2]
	]);
	initItem(INVITEMS.SYRUP, "Syrup", sSyrup, [
		[INVITEMS.ORANGE, 1],
		[INVITEMS.APPLE, 1]
	]);
	initItem(INVITEMS.BLOCK_WOOD, "Wood Block", sBlock_Wood, [
		[INVITEMS.WOOD, 2]
	], oWoodBlock);
	
	initItem(INVITEMS.BLOCK_IRON, "Iron Block", sBlock_Iron, [
	[INVITEMS.IRON, 2]
	], oIronBlock);
	
	initItem(INVITEMS.BLOCK_WALL, "Wall Block", sBlock_Wall, [
	[INVITEMS.STONE, 2]
	], wall_obj);
	
	initItem(INVITEMS.TOMATO_SEED, "Tomato Seed", sTomatoSeed, []);
    initItem(INVITEMS.TOMATO, "Tomato", sTomato, []);
    
    initItem(INVITEMS.POTATO_SEED, "Potato Seed", sPotatoSeed, []);
    initItem(INVITEMS.POTATO, "Potato", sPotato, []);
    
    initItem(INVITEMS.CARROT_SEED, "Carrot Seed", sCarrotSeed, []);
    initItem(INVITEMS.CARROT, "Carrot", sCarrot, []);
    
    initItem(INVITEMS.ARTICHOKE_SEED, "Artichoke Seed", sArtichokeSeed, []);
    initItem(INVITEMS.ARTICHOKE, "Artichoke", sArtichoke, []);
    
    initItem(INVITEMS.CHILLI_SEED, "Chilli Seed", sChilliSeed, []);
    initItem(INVITEMS.CHILLI, "Chilli", sChilli, []);
    
    initItem(INVITEMS.GOURD_SEED, "Gourd Seed", sGourdSeed, []);
    initItem(INVITEMS.GOURD, "Gourd", sGourd, []);
    
    initItem(INVITEMS.CORN_SEED, "Corn Seed", sCornSeed, []);
    initItem(INVITEMS.CORN, "Corn", sCorn, []);
	

//Crafting menu
global.craftingMenu = [
"CRAFTING",
"Stats",
INVITEMS.POTION,
INVITEMS.SYRUP,

"Building",
INVITEMS.BLOCK_WOOD,
INVITEMS.BLOCK_IRON,
INVITEMS.BLOCK_WALL,

];

}