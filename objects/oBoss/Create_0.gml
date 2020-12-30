/// @desc

// Initial vars
myTextbox = noone; // Saves current NPC's textbox
triggerHorizontalDisplacement = 2 * global.squareSize; // Displacement x-axis
triggerVerticalDisplacement = 0; // Displacement y-axis

#region
myTextSequence = 
[
"Hello there! Welcome to Ant Corp.! Use SPACE to advance dialogue.",
"You'll be working some deliveries here, in this underground society!",
"You shall take missions from the bulletin board to our right and fulfill them.",
"First of all, to open and close the bulletin board, press Enter.",
"Then, you can choose or abandon an order by pressing the associated number.",
"You can view the order details by pressing M.",
"Now, to meet your deliveries, you will have to traverse the ground itself! " +
"For that you shall use your mighty drill, avoiding magma and such.",
"So, remember: Press the arrow keys to move.",
"Press SPACE to use your drill! Use the arrow keys to direct it.",
"Your drill is powered by the excavated minerals! Therefore:",
"1) You can move upwards while drilling.",
"2) You can excavate ground horizontally while having empty " +
"space below you.",
"BUT... You need to keep moving! Or else gravity will do its bidding.",
"If you feel trapped, pressing R will return you to the last checkpoint!",
"Ok, then. Now go! Send out those packages and show what you're made for!"
];
#endregion

// Variables para facilitar parametrización y herencia
myLayer = "oBoss";
textBoxObject = oTextbox;
textBoxSprite = sTextbox;
defaultSprite = sBoss;
talkingSprite = sBossTalking;

