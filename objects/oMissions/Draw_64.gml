/// @description Descripción de la misión
// Puede escribir su código en este editor

draw_set_color(c_orange);
draw_rectangle(x1GUI, y1GUI, x2GUI, y2GUI, false);

//Según el objetivo de la misión, se selecciona el mensaje a mostrar en la GUI.
if(currentMainMission != 0)
{
	description = mainMission[currentMainMission].phaseDescription[currentMainMissionPhase - 1];
}
//Mensaje por defecto, cuando no hay misión activa.
else
{
	description = "Check the assignment panel to choose a new task.";
}

draw_set_color(c_black);
draw_set_font(GUIDescription);
draw_text(x1GUI + 1 * global.squareSize, y1GUI + 1 * global.squareSize, description); //Se muestra el mensaje.
