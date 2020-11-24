/// @desc Si cambia checkpoint quita star

// Reinicia el sprite si no es el checkpoint actual
if ((global.currentCheckpointX != x || global.currentCheckpointY != y) && image_index == 1)
{
	image_index = 0;
}
