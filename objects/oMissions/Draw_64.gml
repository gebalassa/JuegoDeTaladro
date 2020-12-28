/// @description Descripción de la misión y otros datos
// Puede escribir su código en este editor

//Dibuja el cuerpo de la GUI
draw_set_color(c_orange);
draw_rectangle(x1GUI, y1GUI, x2GUI, y2GUI, false);

//Según el objetivo de la misión, se selecciona el mensaje a mostrar en la GUI.
if(currentMainMission != 0)
{
	description = mainMission[currentMainMission].phaseDescription[currentMainMissionPhase - 1];
}
//Mensaje por defecto, cuando no hay misión activa.
else if(remainingMissions != 0)
{
	description = "Check the assignment panel to choose a new task.";
}
//Cuando se han completado todas las misiones.
else
{
	description = "Thanks for playing Ant Corp!";
}

#region //Selección del nombre de sala apropiado para mostrar.

if(room == Oficina)
{
	roomName = "Ant Corp Office";
}
else if(room == BifurcationZone)
{
	roomName = "Bifurcation Zone";
}
else if(room == StoneQuarry)
{
	roomName = "Stone Quarry";
}
else if(room == BoilerRoom)
{
	roomName = "Boiler Room";
}
else if(room == TortuousClimb)
{
	roomName = "Tortuous Climb";
}
else if(room == OfficesRooftop)
{
	roomName = "Office's Rooftop";
}
else if(room == AntCorpStatue)
{
	roomName = "Ant Corp Statue";
}
else
{
	roomName = "";
}

#endregion

//Dibuja el rectángulo para el nombre de la sala.
draw_set_color(c_maroon);
draw_rectangle(x1GUI, y1GUI, x2GUI, y1GUI + 0.5 * global.squareSize, false);

//Escribe el nombre de la sala.
draw_set_color(c_ltgray);
draw_set_font(CurrentRoom);
draw_text(x1GUI + 4, y1GUI + 4, roomName);

//Escribe el objetivo actual.
draw_set_color(c_black);
draw_set_font(GUIDescription);
draw_text(x1GUI + 1 * global.squareSize, y1GUI + 1 * global.squareSize, description); //Se muestra el mensaje.
