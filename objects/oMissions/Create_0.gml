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

#region //Misiones de testeo

//MISIÓN DE TESTEO 1.
destinationRoomTest1[0] = Room1;
destinationRoomTest1[1] = Room2;
destinationRoomTest1[2] = Room3;

destinationXTest1[0] = 11 * global.squareSize;	destinationYTest1[0] = 9 * global.squareSize;
destinationXTest1[1] = 4 * global.squareSize;	destinationYTest1[1] = 9 * global.squareSize;
destinationXTest1[2] = 16 * global.squareSize;	destinationYTest1[2] = 8 * global.squareSize;

requirementsMetTest1[0] = true;
requirementsMetTest1[1] = false;
requirementsMetTest1[2] = false;

mainMissionTest1 =
{
	enabled: true,
	totalPhases: 3,
	currentPhase: 1,
	destinationRoom: destinationRoomTest1,
	destinationX: destinationXTest1,
	destinationY: destinationYTest1,
	requirementsMet: requirementsMetTest1,
	completed: false
};


//MISIÓN DE TESTEO 2.
destinationRoomTest2[0] = Room0;

destinationXTest2[0] = 14 * global.squareSize;	destinationYTest2[0] = 2 * global.squareSize;

requirementsMetTest2[0] = true;

mainMissionTest2 = 
{
	enabled: true,
	totalPhases: 1,
	currentPhase: 1,
	destinationRoom: destinationRoomTest2,
	destinationX: destinationXTest2,
	destinationY: destinationYTest2,
	requirementsMet: requirementsMetTest2,
	completed: false
};
#endregion

#region

destinationRoomA2[0] = Area2;

destinationXA2[0] = 1 * global.squareSize; destinationYA2[0] = 7 * global.squareSize;

requirementsMetA2[0] = false;


mainMissionA2 = 
{
	enabled: true,
	totalPhases: 1,
	currentPhase: 1,
	destinationRoom: destinationRoomA2,
	destinationX: destinationXA2,
	destinationY: destinationYA2,
	requirementsMet: requirementsMetA2,
	completed: false
};

#endregion


choice = noone; //Selección de misión.
currentMainMission = 0;
currentMainMissionPhase = 0;


//DEFINICIÓN DEL ARREGLO QUE CONTIENE TODAS LAS MISIONES.
totalMainMissions = 3;
mainMission = array_create(totalMainMissions);

mainMission[0] = mainMissionNull;
mainMission[1] = mainMissionNull;
mainMission[2] = mainMissionA2;

for(var i = 3;i<totalMainMissions;i++;)
{
	mainMission[i] = mainMissionNull;
}


allowingAlarm = array_create(12, true); //Arreglo booleano para controlar las alarmas.