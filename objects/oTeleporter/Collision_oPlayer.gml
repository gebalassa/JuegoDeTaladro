/// @desc Teletransportar a destino

/// Teletransportar jugador

// Reinicia Habitación
room_restart();

// Teletransportacion
room_goto(targetRoom);
other.x = targetX;
other.y = targetY;