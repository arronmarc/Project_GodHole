function init(){

gml_pragma("global", "init()");


//Items
enum ITEM {
	APPLE,
	ORANGE,
	WOOD
	}
	
	global.itemSprite[ITEM.APPLE] = sApple;
	global.itemSprite[ITEM.ORANGE] = sOrange;
	global.itemSprite[ITEM.WOOD] = sWood;


}