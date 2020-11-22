/// @description Inicialización
// Puede escribir su código en este editor

var targetObject = oPlayer; //Objeto inicial al que la cámara centra.

//Inicializa la vista 0.
view_camera[0] = camera_create_view(0, 0, global.squareSize * 19, global.squareSize * 11, 0, targetObject, -1, -1);
view_wport[0] = global.squareSize * 19;
view_hport[0] = global.squareSize * 11;
view_visible[0] = true;


//Coordenadas del centro de la vista.
cameraCenterX = view_wport[0]/2;
cameraCenterY = view_wport[0]/2;

//La cámara sigue instantáneamente a su objetivo.
camera_set_view_border(view_camera[0], cameraCenterX, cameraCenterY);