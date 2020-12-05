/// @desc

/// Starting variables

// Condition Variables
movementHorizontal = true;
movementVertical = true;
allowDrill = true;

// Defaults
defaultFallSpeed = 8;

//
movementSpeed = 8;
fallSpeed = defaultFallSpeed;

movementCounter = 0;
movementCounterVertical = 0;

horizontalDirection = 0;

horizontalCycle = false;
verticalCycle = false;

// Drill
myDrill = noone; // Contiene id del taladro creado actualmente
distDrill = 1; // Distancia jugador-taladro
currentDrillCycle = 0; // 0=None, 1=Right, 2=Left, 3=Up, 4=Down
justDestroyedGround = false; // Para controlar cuando se acaba de destruir tierra
horizontalDrilling = false; // Para cuando se excava lateralmente

//// Variables lastFrame (contendrán informacion de la ultima frame, van al final
// de Step)
/// a. Raw
lastRawKeyRight = 0;
lastRawKeyLeft = 0;
lastRawKeyUp = 0;
lastRawKeyDown = 0;
lastRawKeySpace = 0;

/// b. Normales
lastKeyRight = 0;
lastKeyLeft = 0;
lastKeyUp = 0;
lastKeyDown = 0;
lastKeySpace = 0;

/// c. Otras
lastCurrentDrillCycle = 0;
isSameRawKeysAsLastFrame = false;
isSubsetOfOldRawKeys = false;
isAnyRawKeyActive = false;
