/// @desc Teleport to other room.

// NOTA: Primeros DOS tipos solo sirven para habitaciones de IGUAL TAMANO!!!

// Defining properties of oPlayer when teleporting
// 1) Horizontal Teleport (Y axis constant)
if (type == 1)
{
	other.room_goto(targetRoom);
	other.x = targetX;
	targetY = instance_find(oPlayer, 0).y;
}

// 2) Vertical Teleport (X axis constant)
else if (type == 2)
{
	other.room_goto(targetRoom);
	targetX = instance_find(oPlayer, 0).x;
	other.y = targetY;
}

// 3) Posicion exacta. Teletransporta directamente a donde se indique.
else if (type == 3)
{
	other.room_goto(targetRoom);
	other.x = targetX;
	other.y = targetY;
}
