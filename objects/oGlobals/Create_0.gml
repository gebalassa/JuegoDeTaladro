/// @desc Creation of Global Vars

// Tamano de los cuadrados en pixeles
global.squareSize = 64;

// Checkpoints
global.currentCheckpointRoom = noone;
global.currentCheckpointX = -1;
global.currentCheckpointY = -1;
global.isCheckpointActive = false;
global.isCheckpointOnCooldown = false;

//Cámara
//Las únicas que llegan a usarse (05-12-20) son wCam y hCam.
//Las otras podrían quedar obsoletas a futuro.
global.x1Cam = noone;
global.y1Cam = noone;
global.x2Cam = noone;
global.y2Cam = noone;
global.wCam = noone;
global.hCam = noone;