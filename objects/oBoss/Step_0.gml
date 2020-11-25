/// @desc

// Collision with Player
if place_meeting(x, y, oPlayer)
{
	// If textbox is not created, create it and save it.
	if (myTextbox == noone)
	{
		// Saving & Creating textbox
		myTextbox = instance_create_layer(x, y, "oBoss", oTextbox);
		myTextbox.y -= sprite_get_height(sTextbox); // Positioned just above NPC
	}
}
else
{
	if (myTextbox != noone)
	{
		// Destroy textbox if collision ends
		instance_destroy(myTextbox);
		myTextbox = noone;
	}
}
