/// @desc

// --How does basic movement work?--
// 1) movementHorizontal -> Enables horizontalCycle
// 2) horizontalCycle -> DISABLES movementHorizontal until over
// 3) horizontalCycle ENDS -> movementHorizontal is ENABLED
// 4) horizontalCycle -> PREVENTS movementVertical
// 5) movementVertical + hole on ground -> verticalCycle
// 6) verticalCycle -> PREVENTS movementHorizontal & movementVertical
// 7) verticalCycle ENDS -> Enables movementHorizontal & movementVertical

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
	
	// If there's a rock in the way...
	if (place_meeting(x + global.squareSize * horizontalDirection, y, oRock))
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
// Meanwhile, 'movementHorizontal' is deactivated, avoiding sudden direction change
// which could lead to partial movement.
if (horizontalCycle)
{
	x += movementSpeed * horizontalDirection;
	movementHorizontal = false;
	
	movementCounter++;
	// End of Animation
	if (movementCounter == global.squareSize / movementSpeed)
	{		
		// Restarting variables
		horizontalCycle = false;
		horizontalDirection = 0;
		movementCounter = 0;
		movementHorizontal = true;
	}
}
//show_debug_message(string(squareCoordinateX[squareX]) + " " + string(squareCoordinateY[squareY]));
//----------------------------------------------


/// Vertical Movement
//------------------------------------------------
if (movementVertical)
{
	// If there's NO floor and horizontalCycle is false...
	if (!place_meeting(x, y + global.squareSize * sign(fallSpeed), oRock)) && (!horizontalCycle)
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
		// Restarting variables && reactivating horizontal movement
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


// 