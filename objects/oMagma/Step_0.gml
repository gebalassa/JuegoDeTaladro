/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//Todas las instancias de oMagma ejecutan este código.

//El primer paso es comprobar el flujo hacia abajo.
//Como primera condición, si ya existe magma por debajo, no es necesario crear más.
if(creatingMagma  and  !place_meeting(x, y + global.squareSize, oMagma))
{
	//La última condición antes de fluir hacia abajo es que no exista un sólido en
	//el sitio.
	if(!place_meeting(x, y + global.squareSize, oSolid))
	{
		alarm_set(0, room_speed * creatingSpeed);
		creatingMagma = false;
	}
	//Cumpliendo la primera condición, y no la segunda, se procede al segundo paso:
	//comprobar el flujo lateral; para esto no debe haber ni sólidos, ni magma.
	else
	{
		//Comprueba la derecha...
		if(!place_meeting(x + global.squareSize, y, oSolid)  and  !place_meeting(x + global.squareSize, y, oMagma))
		{
			alarm_set(1, room_speed * creatingSpeed);
			creatingMagma = false;
		}
		//...y la izquierda.
		if(!place_meeting(x - global.squareSize, y, oSolid)  and  !place_meeting(x - global.squareSize, y, oMagma))
		{
			alarm_set(2, room_speed * creatingSpeed);
			creatingMagma = false;
		}
	}
}

//Cualquier caso de flujo llama a una alarma y desactiva la creación de magma.
//Al ejecutarse la alarma, se reactiva la creación.

	//Se verifica que no se estén creando instancias infinitas.
	//show_debug_message(string(instance_number(oMagma)));
