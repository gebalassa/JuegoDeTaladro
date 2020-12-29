/// @description Ocultamiento
// Puede escribir su código en este editor
//Sólo si tiene relación con la misión 4, y ésta no ha sido completada.
if(fromMission4  and  !oMissions.mainMission[4].completed)
{
	//Si se ha superado la fase asociada, se muestra.
	if(oMissions.currentMainMissionPhase > numberOfPhase)
	{
		visible = true;
	}
	//Pero hasta entonces, se mantiene oculta.
	else
	{
		visible = false;
	}
}
