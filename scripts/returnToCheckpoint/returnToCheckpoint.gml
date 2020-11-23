// Código de regreso a checkpoint
function returnToCheckpoint()
{
	if (global.isCheckpointActive && !global.isCheckpointOnCooldown)
	{
		room_restart(); // Reinicia la habitacion de la cual se esta saliendo
		room_goto(global.currentCheckpointRoom);
	
		// Posicion y reinicio variables del jugador
		oPlayer.x = global.currentCheckpointX;
		oPlayer.y = global.currentCheckpointY;
		with (oPlayer)
		{
			oPlayerRestartVars();
		}
	
		// Activar Cooldown
		global.isCheckpointOnCooldown = true;
		oGlobals.alarm[0] = room_speed * 1;
	}
	else if (!global.isCheckpointActive)
	{
		game_restart();
	}
}