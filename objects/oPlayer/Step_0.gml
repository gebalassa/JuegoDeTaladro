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
	// Cambio en fallSpeed a negativo cuando se usa el taladro hacia arriba, y HAY tierra 
	
	//if (place_meeting(x, y - global.squareSize * sign(fallSpeed), oGround) && currentDrillCycle == 3)
	//{ fallSpeed = -1 * abs(fallSpeed); sdm("REEEEE"); } else { fallSpeed = abs(fallSpeed); }	
	if (justDestroyedGround && currentDrillCycle == 3)
	{ fallSpeed = -1 * abs(fallSpeed); } else { fallSpeed = abs(fallSpeed); }
	
	// Hole in Floor (if pos. fallSpeed) or Up-Drill movement (if neg. Fallspeed)
	if (!place_meeting(x, y + global.squareSize * sign(fallSpeed), oSolid))
	{
		// Enables verticalCycle
		verticalCycle = true;
		// Deactivate horizontal/vert ical inputs while falling at least one complete block
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
	if (movementCounterVertical == global.squareSize / abs(fallSpeed) )
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
	isOneDirectionPressed = keyRight ^^ keyLeft ^^ keyUp ^^ keyDown; // Verif. q mant. una dir. UNICA
	
	// Creacion taladro
	// Si no existe el taladro, se tiene presionado Space y UNA direccion...
	if (!instance_exists(myDrill) && keySpace && isOneDirectionPressed)
	{
		// Derecha
		if (keyRight)
		{
			myDrill = instance_create_layer(x + distDrill * global.squareSize, y, "oPlayer", oDrill);
			currentDrillCycle = 1;
			myDrill.myPlayer = self;
		}
		
		// Izquierda
		// NOTA: Origen es Top Left, entonces se debe compensar cuando se usa image_xscale
		// para mantener posición ya que el origen pasa a Top Right. Por eso a "x" no le
		// estamos restando nada. Distinto sería si el origen estuviese en el centro.
		else if (keyLeft)
		{
			myDrill = instance_create_layer(x, y, "oPlayer", oDrill);
			myDrill.image_xscale = -1;
			currentDrillCycle = 2;
			myDrill.myPlayer = self;
		}
		
		// Up
		// NOTA: Tal y como con Izquierda se compensa por punto de origen.
		// En este caso, no se suma nada ni a X ni a Y.
		else if (keyUp)
		{
			myDrill = instance_create_layer(x, y, "oPlayer", oDrill);
			myDrill.image_angle = 90; // Hacia arriba
			currentDrillCycle = 3;
			myDrill.myPlayer = self;
		}
		
		// Abajo
		// NOTA: Tal y como con Izquierda, es necesario compensar debido al punto de origen.
		// En este caso, sumamos un bloque al eje X.		
		else if (keyDown)
		{
			myDrill = instance_create_layer(x + global.squareSize,
			y + distDrill * global.squareSize, "oPlayer", oDrill);
			myDrill.image_angle = 270; // Hacia abajo
			currentDrillCycle = 4;
			myDrill.myPlayer = self;
		}
	}
	
	// Mantencion taladro
	// Si existe el taladro, se tiene presionado Space y se tiene presionado UNA direccion...
	else if (instance_exists(myDrill) && keySpace && isOneDirectionPressed)
	{		
		// Derecha
		if (currentDrillCycle == 1) 
		{
			myDrill.x = x + distDrill * global.squareSize;
			myDrill.y = y;
		}
		
		// Izquierda
		// NOTA: Origen es Top Left, entonces se debe compensar cuando se usa image_xscale
		// para mantener posición ya que el origen pasa a Top Right. Por eso a "x" no le
		// estamos restando nada. Distinto sería si el origen estuviese en el centro.
		else if (currentDrillCycle == 2)
		{
			myDrill.x = x;
			myDrill.y = y;
			myDrill.image_xscale = -1;
		}
		
		// Up
		// NOTA: Tal y como con Izquierda se compensa por punto de origen.
		// En este caso, no se suma nada ni a X ni a Y.
		else if (currentDrillCycle == 3)
		{
			myDrill.x = x;
			myDrill.y = y;
			myDrill.image_angle = 90; // Hacia arriba
		}
		
		// Abajo
		// NOTA: Tal y como con Izquierda, es necesario compensar debido al punto de origen.
		// En este caso, sumamos un bloque al eje X.
		else if (currentDrillCycle == 4)
		{
			myDrill.x = x + global.squareSize;
			myDrill.y = y + distDrill * global.squareSize;
			myDrill.image_angle = 270; // Hacia abajo
 	 	}
	}
	 
	// Destruccion Taladro
 	// En otros casos, se elimina oDrill
	else if (instance_exists(myDrill))
	{
		/*
		show_debug_message("myDrill: "+ string(myDrill)+"||"+string(myDrill.image_angle)+
		"||"+string(myDrill.image_xscale));
		*/
		instance_destroy(myDrill);
		myDrill = noone;
		currentDrillCycle = 0;
	}
}