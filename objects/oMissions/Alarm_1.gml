/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

dif = abs(hGUI - GUILastPos);

if(dif != 3 * global.squareSize)
{
		
	hGUI += 8 * hSign;
	alarm_set(1, 1);
}
else
{
	//GUILastPos -= 3 * global.squareSize * hSign;
	GUILastPos -= dif * hSign;
	allowingAlarm[1] = true;
}