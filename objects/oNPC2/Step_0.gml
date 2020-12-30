/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

if(oMissions.currentMainMission == 2  or  oMissions.mainMission[2].completed)
{
	triggerHorizontalDisplacement = -2 * global.squareSize;
	triggerVerticalDisplacement = 3 * global.squareSize;
}