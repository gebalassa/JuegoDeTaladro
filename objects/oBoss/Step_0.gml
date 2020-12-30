/// @desc

// Collision with Player
// Displacement allows dialogue to start without touching the NPC directly.
if place_meeting(x + triggerHorizontalDisplacement, y + triggerVerticalDisplacement, oPlayer)
{
	// If textbox is not created, create it and save it.
	if (myTextbox == noone)
	{
		// Saving & Creating textbox
		myTextbox = instance_create_layer(x, y, "oBoss", oTextbox);
		myTextbox.y -= sprite_get_height(sTextbox); // Positioned just above NPC
		
		// Talking sprite
		sprite_index = sBossTalking;
	}
}
else
{
	if (myTextbox != noone)
	{
		// Destroy textbox if collision ends
		instance_destroy(myTextbox);
		myTextbox = noone;
		
		// Non-talking sprite
		sprite_index = sBoss;
	}
}
