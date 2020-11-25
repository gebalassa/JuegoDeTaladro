/// @description Transcurso de las misiones
// Puede escribir su código en este editor

//SELECCIÓN DE MISIÓN
//Considerando oBoard como único en el juego, se debe estar en la sala que lo contiene para modificar la misión actual.
if(room == Area1)
{
	//Una vez se comprueba que el jugador está en la sala donde oBoard existe, se consulta si el tablón está abierto.
	if(oBoard.showing)
	{
		//Selección.
		if(keyboard_check_pressed(ord("1"))) {choice = 1;}
		if(keyboard_check_pressed(ord("2"))) {choice = 2;}
		if(keyboard_check_pressed(ord("3"))) {choice = 3;}
	
		if(choice != noone)
		{
			//Si se selecciona una misión que existe, pero no está habilitada, o ya fue completada, se anula la selección.
			if(!mainMission[choice].enabled  or  mainMission[choice].completed) {choice = noone;}
		}
	
		//Deselección de una misión.
		if(choice == currentMainMission)
		{
			currentMainMission = 0;
			currentMainMissionPhase = 1;
			instance_destroy(oDestination, false);
		}
		//Selección correcta. No se puede seleccionar una nueva misión si no se ha completado o abandonado la anterior.
		else if(choice != noone  and  currentMainMission == 0)
		{
			currentMainMission = choice;
			currentMainMissionPhase = 1;
		}
	
		choice = noone;
	}
}


//Misión activa
if(currentMainMission != 0)
{
	//Se actualizan las características de la misión, según la fase actual de ésta.
	currentDestinationRoom	= mainMission[currentMainMission].destinationRoom	[currentMainMissionPhase - 1];
	currentDestinationX		= mainMission[currentMainMission].destinationX		[currentMainMissionPhase - 1];
	currentDestinationY		= mainMission[currentMainMission].destinationY		[currentMainMissionPhase - 1];
	currentRequirementsMet	= mainMission[currentMainMission].requirementsMet	[currentMainMissionPhase - 1];
	
	//Cuando la sala actual coincide con la sala de destino, se crea el objeto destino: oDestination.
	if(room == currentDestinationRoom  and  !instance_exists(oDestination))
	{
		instance_create_layer(currentDestinationX, currentDestinationY, "oPlayer", oDestination);
	}
	
	//Cuando oDestination existe:
	if(instance_exists(oDestination))
	{
		//Se consulta si se han cumplido los requerimientos para completar la fase actual.
		//El sprite cambia según la completitud de los requerimientos.
		if(currentRequirementsMet)
		{
			oDestination.sprite_index = sDestinationEnabled;
		}
		else
		{
			oDestination.sprite_index = sDestinationDisabled;
		}
		
		//Cuando la posición del jugador coincide con la de un oDestination habilitado:
		if(currentDestinationX == oPlayer.x  and  currentDestinationY == oPlayer.y  and  oDestination.sprite_index == sDestinationEnabled)
		{
			instance_destroy(oDestination, false); //Se destruye oDestination.
			currentMainMissionPhase++; //Se avanza a la siguuiente fase.
		}
	}
	
	//Completar todas las fases implica completar la misión.
	if(currentMainMissionPhase > mainMission[currentMainMission].totalPhases)
	{
		mainMission[currentMainMission].completed = true;
		//Reinicio de variables.
		currentMainMission = 0;
		
		currentDestinationRoom	= noone;
		currentDestinationX		= noone;
		currentDestinationY		= noone;
		currentRequirementsMet	= noone;
	}
		
		
	//Condiciones especiales
	//GENERALES (misión).
	
	#region 
	switch(currentMainMission)
	{
		case 2:	switch(currentMainMissionPhase)
				{
					case 1: if(room == currentDestinationRoom  and  collision_point(1 * global.squareSize, 14 * global.squareSize, oMagma, false, true))
							{
								mainMission[currentMainMission].requirementsMet[currentMainMissionPhase - 1] = true;
							}
							else
							{
								mainMission[currentMainMission].requirementsMet[currentMainMissionPhase - 1] = false;
							}
							break;
				}
				break;
	}
	#endregion
	
	#region //condiciones de misiones de testeo
	/*
	switch(currentMainMission)
	{
		case 1:	//ESPECÍFICAS (fase).
				switch(currentMainMissionPhase)
				{
					//Misión 1, fase 2: requiere usar el sombrero.
					case 2:	if(oPlayer.sprite_index == sPlayerHat)
							{
								mainMission[currentMainMission].requirementsMet[currentMainMissionPhase - 1] = true;
							}
							else
							{
								mainMission[currentMainMission].requirementsMet[currentMainMissionPhase - 1] = false;
							}
							break;
							
					//Misión 1, fase 3: requiere que el jugador permanezca 5 segundos en la sala de destino.
					case 3: if(room == currentDestinationRoom)
							{
								if(allowingAlarm[0])
								{
									alarm_set(0, 1);
								}
								else if(current_time - initializedCounter > 5000)
								{
									mainMission[currentMainMission].requirementsMet[currentMainMissionPhase - 1] = true;
								}
							}
							else
							{
								allowingAlarm[0] = true;
							}
				}
				break;
	}
	*/
	#endregion
}