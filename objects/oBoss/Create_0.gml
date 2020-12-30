/// @desc

// Initial vars
myTextbox = noone; // Saves current NPC's textbox
triggerHorizontalDisplacement = 2 * global.squareSize; // Displacement x-axis
triggerVerticalDisplacement = 0; // Displacement y-axis

// Variables para facilitar parametrización y herencia
myLayer = "oBoss";
textBoxObject = oTextbox;
textBoxSprite = sTextbox;
defaultSprite = sBoss;
talkingSprite = sBossTalking;