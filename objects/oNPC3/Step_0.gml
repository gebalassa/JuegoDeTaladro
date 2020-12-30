/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

if(oMissions.mainMission[3].completed)
{
		//sdm(string(phase));
	switch(phase)
	{
		case 1:		sdm(string(image_index));
				sprite_index = sNPC3Talking;
				if(image_index > 3.9)
				{
					sprite_index = sNPC3;
					phase++;
				}
				break;
				
		case 2: x += movSpeed * movSign;
				movementCounter++;

				if(movementCounter = global.squareSize / movSpeed)
				{
					movementCounter = 0;
					phase++;
				}
				break;
				
		case 3: door.moving = true;
				if(door.opened)
				{
						door.image_alpha = 0;
					phase++;
				}
				break;
				
		case 4: x += movSpeed * movSign;
				movementCounter++;

				if(movementCounter = global.squareSize / movSpeed)
				{
					movementCounter = 0;
					phase++;
				}
				break;
	}
}