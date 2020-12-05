/// @description Movimiento de la GUI
// Puede escribir su código en este editor

dif = abs(hGUI - GUILastPos); //Diferencia entre la altura actual de la GUI, y la última posición en que se mantuvo quieta.

//Mientras la GUI no se haya movido 3 casillas desde el accionamiento:
if(dif != 3 * global.squareSize)
{
	hGUI += 8 * hSign; //Se desplaza según el signo.
	alarm_set(1, 1); //Se repite el evento.
}
//Cuando se ha completado el movimiento:
else
{
	GUILastPos = hGUI; //Se actualiza la última posición.
	allowingAlarm[1] = true; //Se reactiva el accionamiento voluntario.
}