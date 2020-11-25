/// @description Descripción de la misión
// Puede escribir su código en este editor

draw_set_color(c_orange);
draw_rectangle(x1GUI, y1GUI, x2GUI, y2GUI, false);

if(currentMainMission != 0)
{
	description = mainMission[currentMainMission].phaseDescription[currentMainMissionPhase - 1];
}
else
{
	description = "Revisa el panel de encargos para escoger una nueva tarea.";
}

draw_set_color(c_black);
draw_set_font(GUIDescription);
draw_text(x1GUI + 1 * global.squareSize, y1GUI + 1 * global.squareSize, description);
