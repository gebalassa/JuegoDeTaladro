/// @description Sprite según selección
// Puede escribir su código en este editor
if(oMissions.mainMission[number].completed)
{
	instance_destroy(self, true);
}

if(oMissions.currentMainMission == number)
{
	sprite_index = sCartelSelected;
}
else
{
	sprite_index = sCartel;
}