/// @desc

// Initial vars
myTextbox = noone; // Saves current NPC's textbox
triggerHorizontalDisplacement = 1 * global.squareSize; // Displacement x-axis
triggerVerticalDisplacement = 0; // Displacement y-axis

// Variables para facilitar parametrización y herencia
myLayer = "oNPCs";
textBoxObject = oTextbox;
textBoxSprite = sTextbox;
defaultSprite = sNPC1;
talkingSprite = sNPC1;

//Variables específicas
initialX = x;
initialY = y;

leftmost = initialX - 1 * global.squareSize;
rightmost = initialX + 3 * global.squareSize;
door = inst_75EE166F;

moving = false;
movSpeed = 4;
movSign = 1;
movementCounter = 0;

hasAlreadySpoken = false;

function move(_sign)
{
	x += movSpeed * _sign;
	movementCounter++;
	
	if(movementCounter = global.squareSize / movSpeed)
	{
		moving = false;
		movementCounter = 0;
	}
}