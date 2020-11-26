/// @description Creación de misiones
// Puede escribir su código en este editor

//DEFINICIÓN DE MISIONES.

//MISIÓN NULA.
//Miembros dependientes de la fase actual.
destinationRoomNull[0] = noone;

destinationXNull[0] = -1; destinationYNull[0] = -1;

requirementsMetNull[0] = false;

//Estructura inicializada.
mainMissionNull = 
{
	enabled: false,
	totalPhases: 0,
	currentPhase: 0,
	destinationRoom: destinationRoomNull,
	destinationX: destinationXNull,
	destinationY: destinationYNull,
	requirementsMet: requirementsMetNull,
	completed: false
};


#region

destinationRoomA2[0] = Area2;

destinationXA2[0] = 1 * global.squareSize; destinationYA2[0] = 7 * global.squareSize;

requirementsMetA2[0] = false;

phaseDescriptionA2[0] = "Go to the right area, fill the bottom with magma and return safely.";

mainMissionA2 = 
{
	enabled: true,
	totalPhases: 1,
	currentPhase: 1,
	phaseDescription: phaseDescriptionA2,
	destinationRoom: destinationRoomA2,
	destinationX: destinationXA2,
	destinationY: destinationYA2,
	requirementsMet: requirementsMetA2,
	completed: false
};


destinationRoomA3[0] = Area3;

destinationXA3[0] = 7 * global.squareSize; destinationYA3[0] = 6 * global.squareSize;

requirementsMetA3[0] = true;

phaseDescriptionA3[0] = "Go to the upper area and make your delivery.";

mainMissionA3 = 
{
	enabled: true,
	totalPhases: 1,
	currentPhase: 1,
	phaseDescription: phaseDescriptionA3,
	destinationRoom: destinationRoomA3,
	destinationX: destinationXA3,
	destinationY: destinationYA3,
	requirementsMet: requirementsMetA3,
	completed: false
};

#endregion

choice = noone; //Selección de misión.
currentMainMission = 0;
currentMainMissionPhase = 0;


//DEFINICIÓN DEL ARREGLO QUE CONTIENE TODAS LAS MISIONES.
totalMainMissions = 10;
mainMission = array_create(totalMainMissions);

mainMission[0] = mainMissionNull;
mainMission[1] = mainMissionNull;
mainMission[2] = mainMissionA2;
mainMission[3] = mainMissionA3;

for(var i = 4;i<totalMainMissions;i++;)
{
	mainMission[i] = mainMissionNull;
}

//Arreglo booleano para controlar las alarmas.
allowingAlarm = array_create(12);
for(var j = 0;j<12;j++;)
{
	allowingAlarm[j] = true;
}

hGUI = 3 * global.squareSize;
//hGUI = 0;

GUILastPos = 3 * global.squareSize;
//GUILastPos = 0;

hSign = -1;