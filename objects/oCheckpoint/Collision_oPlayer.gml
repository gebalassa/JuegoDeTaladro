/// @desc Modif. vars. globales

// Contacto con jugador activa checkpoint
if (global.currentCheckpointX != x || global.currentCheckpointY != y)
{
	global.currentCheckpointRoom = room;
	global.currentCheckpointX = x;
	global.currentCheckpointY = y;
	global.isCheckpointActive = true;
	image_index = 1;
}