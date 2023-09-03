//Stamina
if(instance_exists(obj_player))
{
	draw_sprite(sBackstamina,1,8,16)
	draw_sprite_ext(sFrontHealth,1,8,16,
	max(0,global.health/global.healthmax),1,0,c_white,1);
	
	draw_sprite(sBackstamina,1,8,24)
	draw_sprite_ext(sFrontMana,1,8,24,
	max(0,global.mana/global.manamax),1,0,c_white,1);
	
	draw_sprite(sBackstamina,1,8,32)
	draw_sprite_ext(sFrontstamina,1,8,32,
	max(0,global.stamina/global.staminamax),1,0,c_white,1);
}
