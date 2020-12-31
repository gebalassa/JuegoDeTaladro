/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
y += 8 * movSign;
movementCounter++;

if(movementCounter == global.squareSize / doorSpeed)
{
	moving = false;
	movementCounter = 0;
	
	if(!opened)
	{
		opened = true;
	}
	else if(!closed)
	{
		closed = true;
	}
}