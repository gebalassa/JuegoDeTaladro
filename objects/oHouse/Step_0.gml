/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(isDoor  and  moving)
{
	if(!opened)
	{
		movSign = -1;
		//alarm_set(0, 1);
	}
	else if(!closed)
	{
		movSign = 1;
		//alarm_set(0, 1);
	}
	
	y += doorSpeed * movSign;
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
}
