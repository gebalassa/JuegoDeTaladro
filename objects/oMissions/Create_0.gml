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

destinationRoomA1[0] = StoneQuarry;
destinationRoomA1[1] = StoneQuarry;

destinationXA1[0] = 9 * global.squareSize; destinationYA1[0] = 28 * global.squareSize;
destinationXA1[1] = 9 * global.squareSize; destinationYA1[1] = 28 * global.squareSize;

requirementsMetA1[0] = true;
requirementsMetA1[1] = false;

phaseDescriptionA1[0] = "Go to the client's home, in the Stone Quarry.";
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


destinationRoomA2[0] = BoilerRoom;

destinationXA2[0] = 1 * global.squareSize; destinationYA2[0] = 7 * global.squareSize;

requirementsMetA2[0] = false;

phaseDescriptionA2[0] = "Go to the Boiler Room, fill the bottom with magma and return safely.";

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


destinationRoomA3[0] = TortuousClimb;

destinationXA3[0] = 7 * global.squareSize; destinationYA3[0] = 6 * global.squareSize;

requirementsMetA3[0] = true;

phaseDescriptionA3[0] = "Go to the top of the Tortuous Climb and make your delivery.";

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


destinationRoomA4[0] = AntCorpStatue;
destinationRoomA4[1] = AntCorpStatue;
destinationRoomA4[2] = AntCorpStatue;
destinationRoomA4[3] = AntCorpStatue;
destinationRoomA4[4] = AntCorpStatue;
destinationRoomA4[5] = AntCorpStatue;

destinationXA4[0] = 10	* global.squareSize; destinationYA4[0] = 33 * global.squareSize;
destinationXA4[1] = 13	* global.squareSize; destinationYA4[1] = 14 * global.squareSize;
destinationXA4[2] = 23	* global.squareSize; destinationYA4[2] = 23 * global.squareSize;
destinationXA4[3] = 7	* global.squareSize; destinationYA4[3] = 16 * global.squareSize;
destinationXA4[4] = 9	* global.squareSize; destinationYA4[4] = 26 * global.squareSize;
destinationXA4[5] = 10	* global.squareSize; destinationYA4[5] = 33 * global.squareSize;

requirementsMetA4[0] = true;
requirementsMetA4[1] = true;
requirementsMetA4[2] = true;
requirementsMetA4[3] = true;
requirementsMetA4[4] = true;
requirementsMetA4[5] = true;

phaseDescriptionA4[0] = "Talk to the client, at the base of the Ant Corp Statue.";
phaseDescriptionA4[1] = "Put the first plant in place.";
phaseDescriptionA4[2] = "Put the second plant in place.";
phaseDescriptionA4[3] = "Put the third plant in place.";
phaseDescriptionA4[4] = "Put the last plant in place.";
phaseDescriptionA4[5] = "Talk to the client again.";

mainMissionA4 = 
{
	enabled: true,
	totalPhases: 6,
	currentPhase: 1,
	phaseDescription: phaseDescriptionA4,
	destinationRoom: destinationRoomA4,
	destinationX: destinationXA4,
	destinationY: destinationYA4,
	requirementsMet: requirementsMetA4,
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
mainMission[4] = mainMissionA4;

for(var i = 5;i<totalMainMissions;i++;)
{
	mainMission[i] = mainMissionNull;
}

//INICIALIZACIÓN DE MISIONES RESTANTES
remainingMissions = 0;

for(var j = 0;j<totalMainMissions;j++;)
{
	if(mainMission[j].enabled)
	{
		remainingMissions++;
	}
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