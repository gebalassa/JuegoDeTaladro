/// @description (DEBUG) Completitud de misiones
// Puede escribir su código en este editor
for(var i = 0;i<totalMainMissions;i++;)
{
	if(mainMission[i].completed)
	{
		draw_set_color(c_green);
	}
	else
	{
		draw_set_color(c_red);
	}

	draw_circle(32+48*i, 32, 16, false);
}

draw_set_color(c_white);
draw_circle(15 * global.squareSize, 15 * global.squareSize, 16, false);
	sdm(string(oMissions.visible));