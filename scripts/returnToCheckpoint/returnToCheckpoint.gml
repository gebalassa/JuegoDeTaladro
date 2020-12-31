// Código de regreso a checkpoint
function returnToCheckpoint()
{
	
	// Regreso voluntario (ej.: Apretando R)
	if (global.isCheckpointActive && !global.isCheckpointOnCooldown && !global.isPlayerDead)
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
	// Regreso involuntario (ej.: Lava)
	else if (global.isCheckpointActive && global.isPlayerDead)
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
		
		// Jugador deja de estar muerto
		global.isPlayerDead = false;
	}
	// Reinicio si no se ha tocado ningún checkpoint
	else if (!global.isCheckpointActive)
	{
		global.isPlayerDead = false; // Por si acaso el jugador murió antes de tocar un checkpoint
		game_restart();
	}
}