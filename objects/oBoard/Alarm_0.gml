/// @description Cierre del tablón
// Puede escribir su código en este editor

//Se ocultan los carteles ajustando su transparencia.
for(var i = 0;i<tmm;i++;)
{
	if(cartels[i] != noone)
	{
		cartels[i].image_alpha = 0;
	}
}
	
//Se vuelve a permitir movimiento del jugador.
oPlayer.movementHorizontal = true;
oPlayer.movementVertical = true;