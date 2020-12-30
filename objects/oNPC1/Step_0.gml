/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

if(oMissions.currentMainMission == 1)
{
	if(oMissions.currentMainMissionPhase == 2)
	{
		moving = true;
	}
	else if(x == initialX)
	{
		moving = false;
	}
}
else if(oMissions.mainMission[1].completed  and  !hasAlreadySpoken)
{
	oPlayerStop();
	
	if(x < rightmost)
	{
		moving = true;
	}
	else if(!(door.opened  or  door.moving))
	{
		self.moving = false;
		door.moving = true;
			//sdm("SE MUEVE");
	}
	else if(!door.opened)
	{
		moving = false;
	}
	else if(x < rightmost + 1 * global.squareSize)
	{
		moving = true;
	}
	else
	{
		moving = false;
		hasAlreadySpoken = true;
	}
}

if(x == leftmost)
{
	movSign = 1;
}
else if(x == rightmost  and  !(door.opened  or  door.moving))
{
	movSign = -1;
}

if(moving)
{
	move(movSign);
}
