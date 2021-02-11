/// @desc Creation of Global Vars
//**SÓLO DEBE COLOCARSE EN LA PRIMERA HABITACIÓN DEL JUEGO
// DONDE SE REQUIERAN VARIABLES GLOBALES Y NINGUNA OTRA
// PARA EVITAR REINICIAR VARIABLES GLOBALES**

// Tamano de los cuadrados en pixeles
global.squareSize = 64;

// Checkpoints
global.currentCheckpointRoom = noone;
global.currentCheckpointX = -1;
global.currentCheckpointY = -1;
global.isCheckpointActive = false;
global.isCheckpointOnCooldown = false;
global.isPlayerDead = false;

//Cámara
global.x1Cam = noone;
global.y1Cam = noone;
global.x2Cam = noone;
global.y2Cam = noone;
global.wCam = noone;
global.hCam = noone;