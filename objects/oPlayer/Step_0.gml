/// @desc

// --How does basic movement work?-- (OUTDATED!!!!!!!!!!! Solo referencial)
// 1) movementHorizontal -> Enables horizontalCycle
// 2) horizontalCycle -> PREVENTS movementHorizontal & movementVertical
// 3) horizontalCycle ENDS -> Activate everything
// 4) movementVertical + hole on ground -> verticalCycle
// 5) verticalCycle -> PREVENTS movementHorizontal & movementVertical
// 6) verticalCycle ENDS -> Activate Everything

// Chequear teclas
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyDown = keyboard_check(vk_down);
keyUp = keyboard_check(vk_up);
keySpace = keyboard_check(vk_space);

// DEBUGGING
//if (verticalCycle || horizontalCycle)
//{
//	sdm("BANANA");
//}
// FIN DEBUGGING


/// Horizontal Movement
//-----------------------------
if (movementHorizontal)
{
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
	
	// Activacion de horizontalDrilling cuando se usa el taladro hacia el lado, y HAY tierra
	// PREVENCIÓN BUG: Se copió y pego desde 'Vertical Movement' para el bug donde si se
	// excavaba hacia al lado UN ESPACIO y luego inmediatamente hacia arriba se producia el bug
	// donde era posible saltarse un espacio de aire. Los otros casos de este bug se cubren en
	// 'Salto De-Lado-Hacia-Arriba' mas abajo.
	if (justDestroyedGround && (currentDrillCycle == 1 || currentDrillCycle == 2))
	{ horizontalDrilling = true; }
	else { horizontalDrilling = false;}
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
//----------------------------------------------


/// Vertical Movement
//------------------------------------------------
if (movementVertical)
{	
	
	// Bug 'Salto De-Lado-Hacia-Arriba'
	// Prevención BUG: Salto de espacio vacio hacia arriba usando justDestroyedGround de
	// mov. horizontal.
	// Si se está en horizontalDrilling y se pasa a excavar hacia arriba con un espacio vacio,
	// esta condicion setea justDestroyedGround en 0 para que sección 'Cambio en fallSpeed' no cambie
	// el movimiento vertical hacia arriba, activando un erroneo verticalCycle en 'Activacion
	// verticalCycle'. Esto producia la posibilidad de usar el mov. hor. para saltarse un espacio
	// hacia arriba.
	var _isGroundAbove = place_meeting(x, y - global.squareSize, oSolid);
	if (!_isGroundAbove && horizontalDrilling && currentDrillCycle == 3)
	{
		justDestroyedGround = 0;
	}
	
	// Cambio en fallSpeed
	// Cambio en fallSpeed a negativo cuando se usa el taladro hacia arriba y HAY tierra
	if (justDestroyedGround && currentDrillCycle == 3)
	{ fallSpeed = -1 * abs(fallSpeed); }
	else { fallSpeed = abs(fallSpeed); }
	
	// Activacion de horizontalDrilling cuando se usa el taladro hacia el lado, y HAY tierra
	if (justDestroyedGround && (currentDrillCycle == 1 || currentDrillCycle == 2))
	{ horizontalDrilling = true; }
	else { horizontalDrilling = false;}
	
	// Activacion verticalCycle
	// Hole in Floor (if pos. fallSpeed) or Up-Drill movement (if neg. Fallspeed).
	if (!place_meeting(x, y + global.squareSize * sign(fallSpeed), oSolid) && !horizontalDrilling)
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
		if (keyRight)
		{
			myDrill.x = x + distDrill * global.squareSize;
			myDrill.y = y;
			myDrill.image_xscale = 1;
			myDrill.image_angle = 0;
			currentDrillCycle = 1;
		}
		
		// Izquierda
		// NOTA: Origen es Top Left, entonces se debe compensar cuando se usa image_xscale
		// para mantener posición ya que el origen pasa a Top Right. Por eso a "x" no le
		// estamos restando nada. Distinto sería si el origen estuviese en el centro.
		else if (keyLeft)
		{
			myDrill.x = x;
			myDrill.y = y;
			myDrill.image_xscale = -1;
			myDrill.image_angle = 0;
			currentDrillCycle = 2;
		}
		
		// Up
		// NOTA: Tal y como con Izquierda se compensa por punto de origen.
		// En este caso, no se suma nada ni a X ni a Y.
		else if (keyUp)
		{
			myDrill.x = x;
			myDrill.y = y;
			myDrill.image_xscale = 1;
			myDrill.image_angle = 90; // Hacia arriba
			currentDrillCycle = 3;
		}
		
		// Abajo
		// NOTA: Tal y como con Izquierda, es necesario compensar debido al punto de origen.
		// En este caso, sumamos un bloque al eje X.
		else if (keyDown)
		{
			myDrill.x = x + global.squareSize;
			myDrill.y = y + distDrill * global.squareSize;
			myDrill.image_xscale = 1;
			myDrill.image_angle = 270; // Hacia abajo
			currentDrillCycle = 4;
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
//-----------------------------------------------------------


//// Sprite de oPlayer
//-----------------------------------------------------------
// Variables locales
var currSpriteIndex = sprite_index;

// Caso de uso de taladro
switch (currentDrillCycle)
{
	case 1: if (currSpriteIndex != sDrill) {sprite_index = sDrill; image_xscale = 1;} break;
	case 2: if (currSpriteIndex != sDrillLeft) {sprite_index = sDrillLeft; image_xscale = 1;} break;
	case 3: if (currSpriteIndex != sDrillUp) {sprite_index = sDrillUp; image_xscale = 1;} break;
	case 4: if (currSpriteIndex != sDrillDown) {sprite_index = sDrillDown; image_xscale = 1;} break;
}

// Caso sin taladro
// 1) Con Movimiento horizontal
var playerDirection = keyRight - keyLeft;
if (currentDrillCycle == 0 && (playerDirection != 0))
{
	switch (playerDirection)
	{
		case 1: if (currSpriteIndex != sPlayerWalk) 
		{ sprite_index = sPlayerWalk; image_xscale = 1;} break;
		case -1: if (currSpriteIndex != sPlayerWalkLeft) 
		{ sprite_index = sPlayerWalkLeft; image_xscale = 1;} break;
	}
}
// Sin movimiento horizontal
else if (currentDrillCycle == 0 && (playerDirection == 0))
{
	if (currSpriteIndex != sPlayer)
	{
		sprite_index = sPlayer; image_xscale = 1;
	}
}
//-----------------------------------------------------------