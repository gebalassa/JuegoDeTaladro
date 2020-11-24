/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/*if(!variable_global_exists("initialPos"))
{
	global.initialPos = array_create(10);
	
	for(var i = 0;i<10;i++;)
	{
		global.initialPos[i].area = noone;
		global.initialPos[i]._x = noone;
		global.initialPos[i]._y = noone;
	}
}

newArea = 0;

for(var j = 0;j<10;j++;)
{
	if(room == global.initialPos[j].area)
	{
		break;
	}
	else if(global.initialPos[j].area == noone)
	{
		global.initialPos[j].area = room;
		newArea = j;
		alarm_set(0, 1);
	}
}