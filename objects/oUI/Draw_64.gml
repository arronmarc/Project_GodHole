//Stamina
if(instance_exists(obj_player))
{
	draw_sprite(sBackstamina,1,8,24)
	draw_sprite_ext(sFrontstamina,1,8,24,
	max(0,global.stamina/global.staminamax),1,0,c_white,1);
}