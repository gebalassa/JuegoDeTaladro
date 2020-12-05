/// @description Destrucción
// Puede escribir su código en este editor

//Al usar teletransporte vertical, el espacio donde spawnea el jugador debe vaciarse.
if(inBorderOfMap)
{
	inBorderOfMap = false;
	instance_destroy(self, false);
}