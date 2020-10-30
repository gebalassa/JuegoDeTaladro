/// @desc

/// Starting variables

// Condition Variables
movementHorizontal = true;
movementVertical = true;
allowDrill = true;

//
movementSpeed = 8;
fallSpeed = 8;

movementCounter = 0;
movementCounterVertical = 0;

horizontalDirection = 0;

horizontalCycle = false;
verticalCycle = false;

// Drill
myDrill = noone; // Contiene id del taladro creado actualmente
distDrill = 1; // Distancia jugador-taladro
currentDrillCycle = 0; // 0=None, 1=Right, 2=Left, 3=Up, 4=Down

// Muerte
death = false;