/// @description Tablón abierto
// Puede escribir su código en este editor

//Si el tablón está cerrado, no ocurre nada.
if(showing)
{
	//El movimiento no está permitido mientras se revise el tablón.
	oPlayer.movementHorizontal = false;
	oPlayer.movementVertical = false;
	
	//Posicionamiento de los carteles. Debiera ejecutarse sólo la primera vez que se abre el tablón.
	if(cartelsSetted)
	{
		cartelsSetted = false;
		
			//trying = 0;
			
		//Intenta colocar los carteles correspondientes.
		do
		{
				//trying++;
			
			//Destruye los carteles generados en un intento anterior fallido.
			with(oCartel)
			{
				instance_destroy(self, false);
			}
				
			//Por cada misión...
			for(i = 0;i<tmm;i++;)
			{
				//...que esté habilitada...
				if(oMissions.mainMission[i].enabled  and  !oMissions.mainMission[i].completed)
				{
					count = 0;
					//...se determina un punto aleatorio donde se creará un cartel.
					do
					{
						count++;
						
						_x = global.x1Cam + random_range(visualBorderXLeft, visualBorderXRight);
						_y = global.y1Cam + random_range(visualBorderYTop, visualBorderYBottom - global.squareSize * 2);
					}until(!collision_point(_x, _y, oCartel, false, true)  or  count >= 500);
					//El cartel nuevo no debe cubrir los anteriores.
					//Se intentará un máximo de 500 veces posicionar el cartel antes de cancelar la creación.
		
					//Se crea el objeto cartel.
					cartels[i] = instance_create_depth(_x, _y, 0, oCartel);
				}
			}
				//show_debug_message("Intento N°" + string(trying));
		}until(count < 500);
			//show_debug_message("Logrado");
	}
	
	//Enter para cerrar el tablón.
	if(keyboard_check_pressed(vk_enter))
	{
		showing = false;
		
		//Para evitar que se reabra el tablón instantáneamente.
		alarm_set(0, 1);
	}
}