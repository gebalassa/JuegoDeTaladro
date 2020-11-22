/// @description Inicialización
// Puede escribir su código en este editor

showing = false; //Indica si el tablón está abierto.
cartelsSetted = true;

scale = 7; //Tamaño, relativo al objeto, del sprite pintado al abrir el tablón.

//Dimensiones reales de oBoard
realWidth = sprite_width * scale;
realHeight = sprite_height * scale;
realBorderXLeft = (global.squareSize * 19 - realWidth) / 2;
realBorderXRight = global.squareSize * 19 - realBorderXLeft;
realBorderYTop = (global.squareSize * 11 - realHeight) / 2;
realBorderYBottom = global.squareSize * 11 - realBorderYTop;

//Dimensiones aparentes de oBoard.
visualWidth = 100 * scale;
visualHeight = 64 * scale;
visualBorderXLeft = (global.squareSize * 19 - visualWidth) / 2;
visualBorderXRight = global.squareSize * 19 - visualBorderXLeft;
visualBorderYTop = (global.squareSize * 11 - visualHeight) / 2;
visualBorderYBottom = global.squareSize * 11 - visualBorderYTop;

//Definición de un arreglo de carteles.
tmm = oMissions.totalMainMissions;
cartels = array_create(tmm);
for(var i = 0;i<tmm;i++;)
{
	cartels[i] = noone;
}

randomize();

count = 0;
	//trying = 0;