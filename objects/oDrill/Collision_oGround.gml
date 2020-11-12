/// @desc Destruir tierra

// Destruccion de tierra
// Si el jugador NO esta en un ciclo de movimiento permite destruccion, evitando
// destruir tierra adicional innecesariamente producto de apuntar el taladro en otra direccion
// durante el proceso.
if (!myPlayer.verticalCycle && !myPlayer.horizontalCycle)
{
	instance_destroy(other);
	myPlayer.justDestroyedGround = true;

	// Activa alarma 1, de reinicio de justDestroyedGround, en oPlayer.
	
	// Duracion mov. 1 bloque vertical + 1 frame para poder entrar al siguiente bloque,
	// evitando caer justo al final del movimiento suponiendo hay vacio debajo.
	//[IGNORAR]// NOTA: Si a futuro en oPlayer, fallSpeed y movementSpeed son distintos,
	// se abarcan ambos casos. [IGNORAR. TODAVIA NO, CODIGO COMENTADO ABAJO]
	var timer = global.squareSize / abs(myPlayer.fallSpeed) + 1;
	myPlayer.alarm[1] = timer;		
	//if (myPlayer.currentDrillCycle == 3 || myPlayer.currentDrillCycle == 4) // hacia ARRIBA y ABAJO
	//{
	//	var timer = global.squareSize / abs(myPlayer.fallSpeed) + 1;
	//	myPlayer.alarm[1] = timer;		
	//}
	//else if (myPlayer.currentDrillCycle == 1 || myPlayer.currentDrillCycle == 0) // Hacia LADOS
	//{
	//	var timer = global.squareSize / abs(myPlayer.movementSpeed) + 1;
	//	myPlayer.alarm[1] = timer;		
	//}
}