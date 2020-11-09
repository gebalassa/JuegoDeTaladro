/// @desc Destruir tierra

// Destruccion de tierra
// Si el jugador NO esta en un ciclo de movimiento permite destruccion, evitando
// destruir tierra adicional innecesariamente.
if (!myPlayer.verticalCycle && !myPlayer.horizontalCycle)
{
	instance_destroy(other);
	myPlayer.justDestroyedGround = true;

	// Activa alarma 1, de reinicio de justDestroyedGround, en oPlayer.
	var timer = global.squareSize / abs(myPlayer.fallSpeed) + 1; //Duracion mov. 1 bloque vertical
	myPlayer.alarm[1] = timer;	
}