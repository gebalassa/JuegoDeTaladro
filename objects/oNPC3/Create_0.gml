/// @desc

// Initial vars
myTextbox = noone; // Saves current NPC's textbox
triggerHorizontalDisplacement = -1 * global.squareSize; // Displacement x-axis
triggerVerticalDisplacement = 0; // Displacement y-axis

// Variables para facilitar parametrización y herencia
myLayer = "oNPCs";
textBoxObject = oTextbox;
textBoxSprite = sTextbox;
defaultSprite = sNPC3;
talkingSprite = sNPC3Talking;

//Variables específicas
//moving = false;
movSpeed = 8;
movSign = -1;
movementCounter = 0;

door = inst_7C4F7208;

phase = 1;


/*x += movSpeed * _sign;
movementCounter++;

if(movementCounter = global.squareSize / movSpeed)
{
	moving = false;
	movementCounter = 0;
}