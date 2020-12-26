// Reinicio variables de movimiento de oPlayer
function oPlayerRestartVars()
{
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
}