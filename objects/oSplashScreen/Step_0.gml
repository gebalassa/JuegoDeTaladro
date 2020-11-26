/// @desc transicion a oficina

// Reduccion de tiempo en 1
time--;

if (time == 0)
{
	room_goto(Oficina);
}