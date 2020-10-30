/// @desc

// --How does basic movement work?--
// 1) movementHorizontal -> Enables horizontalCycle
// 2) horizontalCycle -> PREVENTS movementHorizontal & movementVertical
// 3) horizontalCycle ENDS -> Activate everything
// 4) movementVertical + hole on ground -> verticalCycle
// 5) verticalCycle -> PREVENTS movementHorizontal & movementVertical
// 6) verticalCycle ENDS -> Activate Everything

if(death)
{
	game_restart();
}

/// Horizontal Movement
//-----------------------------
if (movementHorizontal)
{
	keyRight = keyboard_check(vk_right);
	keyLeft = keyboard_check(vk_left);

	horizontalDirection = keyRight - keyLeft;
	
	// If there's a solid in the way...
	if (place_meeting(x + global.squareSize * horizontalDirection, y, oSolid))
	{
		horizontalDirection = 0; // ...Horizontal movement is zero.
	}
	
	// Else if horizontalDirection isn't zero, initiate single-block movement cycle
	else if (horizontalDirection != 0)
	{
		horizontalCycle = true;
	}
}

/// Horizontal Cycle
// If there's horizontalCycle, start fluid movement by 1 block.
// Meanwhile, movement is deactivated, avoiding sudden direction change
// which could lead to partial movement.
if (horizontalCycle)
{
	x += movementSpeed * horizontalDirection;
	movementHorizontal = false;
	movementVertical = false;
	
	movementCounter++;
	// End of Animation
	if (movementCounter == global.squareSize / movementSpeed)
	{		
		// Restarting variables
		horizontalCycle = false;
		horizontalDirection = 0;
		movementCounter = 0;
		movementHorizontal = true;
		movementVertical = true;
	}
}
//show_debug_message(string(squareCoordinateX[squareX]) + " " + string(squareCoordinateY[squareY]));
//----------------------------------------------


/// Vertical Movement
//------------------------------------------------
if (movementVertical)
{
	// If there's NO floor...
	if (!place_meeting(x, y + global.squareSize * sign(fallSpeed), oSolid))
	{
		// Enables verticalCycle
		verticalCycle = true;
		// Deactivate horizontal/vertical inputs while falling at least one complete block
		movementHorizontal = false;
		movementVertical = false;
	}
}

// If there's verticalCycle, start fluid movement by 1 block.
// Meanwhile, 'movementVertical' and 'movementHorizontal' are deactivated.
if (verticalCycle)
{
	y += fallSpeed;
	
	movementCounterVertical++;
	// End of Animation
	if (movementCounterVertical == global.squareSize / fallSpeed)
	{			
		// Restarting variables
		// NOTE: The way this is currently made, one horizontal move is allowed
		// per each blocked dropped. Falls take the form of a 'staircase' if
		// an horizontal direction is held while falling.
		verticalCycle = false;
		movementCounterVertical = 0;
		movementHorizontal = true;
		movementVertical = true;
	}
}
//-----------------------------------------------------------


/// oDrill
//-----------------------------------------------------------
// Permiso de uso de taladro
if (allowDrill)
{
	// Chequear teclas
	keyRight = keyboard_check(vk_right);
	keyLeft = keyboard_check(vk_left);
	keyDown = keyboard_check(vk_down);
	keyUp = keyboard_check(vk_up);
	keySpace = keyboard_check(vk_space);
	isDirectionPressed = keyRight || keyLeft || keyUp || keyDown; // Verifica si se mantiene una direccion
	
	// Si no existe el taladro y se tiene presionado Space...
	if (!instance_exists(myDrill) && keySpace)
	{
		// Izquierda
		if (keyRight)
		{
			myDrill = instance_create_layer(x + distDrill * global.squareSize, y, "oPlayer", oDrill);
			currentDrillCycle = 1;
		}
		
		// Derecha
		// NOTA: Origen es Top Left, entonces se debe compensar cuando se usa image_xscale
		// para mantener posición ya que el origen pasa a Top Right. Por eso a "x" no le
		// estamos restando nada. Distinto sería si el origen estuviese en el centro.
		else if (keyLeft)
		{
			myDrill = instance_create_layer(x, y, "oPlayer", oDrill);
			myDrill.image_xscale = -1;
			currentDrillCycle = 2;
		}
		
	}
	
	// Si existe el taladro, se tiene presionado Space y se tiene presionado alguna direccion...
	// "isDirectionPressed" evita que el taladro continue si solo se mantiene Space.
	else if (instance_exists(myDrill) && keySpace && isDirectionPressed)
	{	
		// Izquierda
		if (keyRight)
		{
			myDrill.x = x + distDrill * global.squareSize;
			myDrill.y = y;
		}
		
		// Derecha
		// NOTA: Origen es Top Left, entonces se debe compensar cuando se usa image_xscale
		// para mantener posición ya que el origen pasa a Top Right. Por eso a "x" no le
		// estamos restando nada. Distinto sería si el origen estuviese en el centro.
		else if (keyLeft)
		{
			myDrill.x = x;
			myDrill.y = y;
			myDrill.image_xscale = -1;
		}
	}
	
	// En otras circunstancias, se elimina oDrill
	else if (instance_exists(myDrill))
	{
		instance_destroy(myDrill);
		myDrill = noone;
		currentDrillCycle = 0;
	}
}
