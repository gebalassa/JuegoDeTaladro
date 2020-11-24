/// @description Número de la misión
// Puede escribir su código en este editor
if(oBoard.showing)
{
	draw_self(); //Posiblemente esta línea vuelva innecesario cambiar la transparencia de los carteles.

	draw_set_font(BigNumbers);
	draw_set_color(c_black);
	draw_text(x-30, y+30, string(number));
}