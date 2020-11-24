/// @description Apertura del tablón
// Puede escribir su código en este editor

//Enter para abrir el tablón. El jugador debe estar quieto y el tablón cerrado.
if(oPlayer.movementHorizontal  and  oPlayer.movementVertical  and  keyboard_check_pressed(vk_enter)  and  !showing)
{
	showing = true;
	//Se revelan los carteles.
	if(!cartelsSetted)
	{
		for(var i = 0;i<tmm;i++;)
		{
			if(cartels[i] != noone)
			{
				cartels[i].image_alpha = 1;
			}
		}
	}
}