// Inherit the parent event
event_inherited();

//Crafting animation
if (craftAnim > 0) {
	draw_rectangle(x, y, x + width * craftAnim, y + height, 0);
}

var _margin = 8;

//Draw item
var _spr = global.itemSprite[item];

draw_sprite_ext(_spr, 0, x + _margin, y + _margin, 1, 1, 0, c_white, 1);

//Draw name
var _name = global.itemName[item];

draw_set_font(fnt_text_24);

draw_text(x + _margin * 8, y + 8, _name);

