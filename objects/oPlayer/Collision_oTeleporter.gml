/// @descr Restart variables

// Restart movement vars
oPlayerRestartVars();

// Set movement cooldown after teleportation
movementHorizontal = false;
movementVertical = false;
alarm_set(0, room_speed * 0.15);