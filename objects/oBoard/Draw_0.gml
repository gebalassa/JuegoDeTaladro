/// @description Tablón en grande
// Puede escribir su código en este editor
draw_self();

if(showing)
{
	depth = initialDepth - 150;
	//Dibuja el tablón en grande.
	draw_sprite_stretched(sprite_index, image_index, realBorderXLeft, realBorderYTop, realWidth, realHeight);
}
else
{
	depth = initialDepth;
}