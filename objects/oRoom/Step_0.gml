/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/*if(keyboard_check_pressed(vk_f1))
{
	for(var i = 0;i<10;i++;)
	{
		if(global.initialPos[i].area == Area1)
		{
			alarm_set(1, 1);
			break;
		}
	}
	room_goto(Area1);
}
if(keyboard_check_pressed(vk_f2))
{
	for(var i = 0;i<10;i++;)
	{
		if(global.initialPos[i].area == Area2)
		{
			alarm_set(1, 1);
			break;
		}
	}
	room_goto(Area2);
}*/

if(keyboard_check_pressed(vk_f1))
{
	room_goto(Area1);
	oPlayer.x = 192;
	oPlayer.y = 960;
}
if(keyboard_check_pressed(vk_f2))
{
	room_goto(Area2);
	oPlayer.x = 128;
	oPlayer.y = 448;
}