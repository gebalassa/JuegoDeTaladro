/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/*if(!variable_global_exists("squareSize"))
{
	global.squareSize = 64;
	global.totalSquaresX = room_width / global.squareSize;
	global.totalSquaresY = room_height / global.squareSize;

	for(var i = 0;i < global.totalSquaresY;i++)
	{
		squareCoordinateY[i] = i * global.squareSize;
		for(var j = 0;j < global.totalSquaresX;j++)
		{
			squareCoordinateX[j] = j * global.squareSize;
				//show_debug_message(string(squareCoordinateX[j]) + " " + string(squareCoordinateY[i]))
		}
	}
}