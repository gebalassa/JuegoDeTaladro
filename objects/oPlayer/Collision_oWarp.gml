/// @descr Restart variables

// Restart movement vars
movementHorizontal = true;
movementVertical = true;

movementSpeed = 8;
fallSpeed = 8;

movementCounter = 0;
movementCounterVertical = 0;

horizontalDirection = 0;

horizontalCycle = false;
verticalCycle = false;

// Set movement cooldown after teleportation
movementHorizontal = false;
movementVertical = false;
alarm_set(0, room_speed * 0.15);