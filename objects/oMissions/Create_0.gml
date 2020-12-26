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

destinationRoomA1[0] = Area4;
destinationRoomA1[1] = Area4;

destinationXA1[0] = 9 * global.squareSize; destinationYA1[0] = 28 * global.squareSize;
destinationXA1[1] = 9 * global.squareSize; destinationYA1[1] = 28 * global.squareSize;

requirementsMetA1[0] = true;
requirementsMetA1[1] = false;

phaseDescriptionA1[0] = "Go to the client's home, in the lower area.";
phaseDescriptionA1[1] = "Stay waiting for the client.";

mainMissionA1 = 
{
	enabled: true,
	totalPhases: 2,
	currentPhase: 1,
	phaseDescription: phaseDescriptionA1,
	destinationRoom: destinationRoomA1,
	destinationX: destinationXA1,
	destinationY: destinationYA1,
	requirementsMet: requirementsMetA1,
	completed: false
};


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
mainMission[1] = mainMissionA1;
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

//Variables de movimiento de GUI.
hGUI = 0; //Altura de la GUI respecto al borde inferior de la cámara.
GUILastPos = hGUI; //Última posición antes de completar un movimiento.
hSign = -1; //Dirección de movimiento.