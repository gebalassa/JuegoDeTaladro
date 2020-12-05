/// @description Actualización
// Puede escribir su código en este editor

	var count = 0; //Para DEBUG 1 vvvvv
	
//Actualización de variables globales
global.wCam = camera_get_view_width(view_camera[0]);
global.hCam = camera_get_view_height(view_camera[0]);
global.x1Cam = camera_get_view_x(view_camera[0]);
global.y1Cam = camera_get_view_y(view_camera[0]);
global.x2Cam = global.x1Cam + global.wCam;
global.y2Cam = global.y1Cam + global.hCam;
	
	
//Actualización de objeto central.
targetObject = oPlayer;
camera_set_view_target(view_camera[0], targetObject);

//Actualización del centro de la vista.
cameraCenterX = camera_get_view_x(view_camera[0]) + view_wport[0]/2;
cameraCenterY = camera_get_view_y(view_camera[0]) + view_hport[0]/2;
	
//Actualización de la máxima distancia a la que el jugador puede visualizar instancias en pantalla.
//(Varía al acercarse a los límites de la sala.)
borderX = 10 * global.squareSize + abs(targetObject.x - cameraCenterX);
borderY = 6 * global.squareSize + abs(targetObject.y - cameraCenterY);

//Actualización de visibilidad de instancias.
with(all)
{
	//Invisibiliza las instancias lejanas.
	if(abs(x - oCamera.targetObject.x) > oCamera.borderX  or  abs(y - oCamera.targetObject.y) > oCamera.borderY)
	{
		if(self.x != oMissions.x)
		{
			visible = false;
		}
	}
	//Visibiliza las instancias cercanas.
	else
	{
		visible = true;
			count++;
	}
}

	//DEBUG 1: Instancias visibles dentro de la sala actual.
	//show_debug_message(string(count) + "/" + string(instance_count));
	
	//DEBUG 2: Coordenadas de la vista de la cámara.
	//show_debug_message(string(camera_get_view_x(view_camera[0])) + "," + string(camera_get_view_y(view_camera[0])));
	
	//DEBUG 3: Coordenadas del jugador respecto a las coordenadas de la vista de la cámara.
	//show_debug_message(string(oPlayer.x - camera_get_view_x(view_camera[0])) + "," + string(oPlayer.y - camera_get_view_y(view_camera[0])));