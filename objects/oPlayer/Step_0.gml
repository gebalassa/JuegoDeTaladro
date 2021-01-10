/// @desc

// --How does basic movement work?-- (OUTDATED!!!!!!!!!!! Solo referencial)
// 1) movementHorizontal -> Enables horizontalCycle
// 2) horizontalCycle -> PREVENTS movementHorizontal & movementVertical
// 3) horizontalCycle ENDS -> Activate everything
// 4) movementVertical + hole on ground -> verticalCycle
// 5) verticalCycle -> PREVENTS movementHorizontal & movementVertical
// 6) verticalCycle ENDS -> Activate Everything


//// Setear variables
//-----------------------------
isHorCycleOverThisFrame = false; // Usada en oDrill.myPlayer

//-----------------------------


//// Chequear teclas
//-----------------------------
/// Teclas brutas (sin procesar)
rawKeyRight = keyboard_check(vk_right);
rawKeyLeft = keyboard_check(vk_left);
rawKeyDown = keyboard_check(vk_down);
rawKeyUp = keyboard_check(vk_up);
rawKeySpace = keyboard_check(vk_space);

// DEBUGGING
//if (rawKeyRight && keyboard_check(ord("K")) )
//{	
//	var foo = 5;
//}
// FIN DEBUGGING

/// Teclas normales (para ser procesadas)
keyRight = rawKeyRight;
keyLeft = rawKeyLeft;
keyDown = rawKeyDown
keyUp = rawKeyUp;
keySpace = rawKeySpace;

/// Comprobacion tecla actual
///Comprobacion teclas direccionales "raw" usando teclas frame anterior (variables "lastFrame").
// Esto facilita el uso de las teclas cuando se quiere cambiar de direccion sin tener que soltar
// la tecla de la frame anterior. Si son las mismas, se mantiene la direccion de movimiento.
// Si nuevas teclas NO SON subconjunto de anteriores, las que se mantuvieron de la frame anterior
// se cancelan para dar paso a las teclas nuevas. Si, por algun motivo, el jugador decide presionar
// VARIAS teclas nuevas, se prioriza segun Derecha > Izquierda > Arriba > Abajo.
// Se usan las teclas "raw" ya que las teclas "normales" guardaran los resultados de cualquier
// procesamiento (ej.: Desactivación).
// **2020-12-03: Es posible que isOneDirectionPressed sea redundante después de esto
// pero se mantendrá por si acaso.

// 1) a] Verificacion de si son las mismas teclas "raw" de frame anterior (isSameRawKeysAsLastFrame)
if (rawKeyRight == lastRawKeyRight && rawKeyLeft == lastRawKeyLeft && rawKeyUp == lastRawKeyUp &&
	rawKeyDown == lastRawKeyDown)
	{ isSameRawKeysAsLastFrame = true; }
else
	{ isSameRawKeysAsLastFrame = false; }

// b] Verificacion de si teclas actuales son subconjunto de teclas antiguas (isSubsetOfOldRawKeys).
// Necesario para que no se borren teclas antiguas si son distintas pero son un subconjunto.
// Ej: Pasaba que si se tenia Izq+Der y se pasaba a Der, se borraba y el jugador se detenia.
//** Por su naturaleza, si isSameRawKeysAsLastFrame es verdadera entonces esta variable igual,
//** pues corresponde isSameRawKeysAsLastFrame al caso particular donde el subconjunto es sí mismo.
if ((!lastRawKeyRight && rawKeyRight) || (!lastRawKeyLeft && rawKeyLeft) ||
	(!lastRawKeyUp && rawKeyUp) || (!lastRawKeyDown && rawKeyDown))
	{ isSubsetOfOldRawKeys = false; }
else
	{ isSubsetOfOldRawKeys = true; }

// c] Verificacion de tecla activa (isAnyRawKeyActive).
// Se usa en "Eleccion en caso de VARIAS teclas NUEVAS", para NO usar teclas del frame anterior
// si no hay ninguna presionada actualmente. Esto previene error donde se salia de la seccion
// con mas de una tecla "normal" seleccionada, destruyendo el propósito de todo este procesamiento.
if (rawKeyRight || rawKeyLeft || rawKeyUp || rawKeyDown)
	{ isAnyRawKeyActive = true; }
else
	{ isAnyRawKeyActive = false; }

// 2) Anulacion de teclas antiguas
// Si las "raw" NO son subconjunto de las del frame anterior, se apagan las "normales" que tenian
// su "raw" activado en la frame anterior. Esto evita que, si SON subconjunto, se apaguen todas por
// considerarse "antiguas" y el jugador se detenga.
if (!isSubsetOfOldRawKeys)
{
	// a. Derecha
	if (keyRight && lastRawKeyRight) { keyRight = 0; }
	
	// b. Izquierda
	if (keyLeft && lastRawKeyLeft) { keyLeft = 0; }
	
		// c. Arriba
	if (keyUp && lastRawKeyUp) { keyUp = 0; }
	
		// d. Abajo
	if (keyDown && lastRawKeyDown) { keyDown = 0; }
}

// 3) Eleccion en caso de VARIAS teclas NUEVAS apretadas, segun prioridad de la forma
// Derecha > Izquierda > Arriba > Abajo. Solo se ejecuta si las teclas "raw" no son las mismas
// de antes. De lo contrario, se setean las "normales" segun variables de frame
// anterior pues debiesen tener UNA SOLA activada, evitando la existencia de múltiples teclas 
// "normales" activadas. En caso de que, además, no haya ninguna tecla presionada
// (!isAnyRawKeyActive), simplemente se salta ese paso.
if (!isSameRawKeysAsLastFrame)
{
	if (keyRight && (keyLeft || keyUp || keyDown))
	{
		keyLeft = 0; keyUp = 0; keyDown = 0;
	}
	else if (keyLeft && (keyUp || keyDown))
	{
		keyUp = 0; keyDown = 0;
	}
	else if (keyUp && keyDown)
	{
		keyDown = 0;
	}
}
else if (isAnyRawKeyActive)
{
	keyRight = lastKeyRight;
	keyLeft = lastKeyLeft;
	keyDown = lastKeyDown;
	keyUp = lastKeyUp;
}

// DEBUGGING
//if (keyboard_check_pressed(ord("K")))
//{	
//	sdm("");
//	sdm("KeyUp: " + string(keyUp) );
//	sdm("KeyDown: " + string(keyDown) );
//	sdm("KeyRight: " + string(keyRight) );
//	sdm("KeyLeft: " + string(keyLeft) );
//	sdm("isSameRawKeysAsLastFrame: " + string(isSameRawKeysAsLastFrame));
//	sdm("isSubsetOfOldRawKeys: " + string(isSubsetOfOldRawKeys));
//}
// FIN DEBUGGING
//-----------------------------


/// Horizontal Movement
//-----------------------------
if (movementHorizontal)
{
	horizontalDirection = keyRight - keyLeft;
	
	// If there's a solid in the way...
	if (place_meeting(x + global.squareSize * horizontalDirection, y, oSolid))
	{		
		// If the drill is NOT to be used in this frame horizontally
		// to destroy the block...
		if (!allowDrill || !keySpace || horizontalDirection == 0)
		{
			horizontalDirection = 0; // ...Horizontal movement is zero.
		}
		
		// If the drill IS to be used and there is oGround...
		else if place_meeting(x + horizontalDirection * global.squareSize, y, oGround)
		{
			var _groundToDestroy = instance_place(x + horizontalDirection * global.squareSize,
												y, oGround);
			var _timer = global.squareSize / abs(movementSpeed) + 1;
			
			// Destroy oGround, add power to the drill through justDestroyedGround.
			instance_destroy(_groundToDestroy);
			justDestroyedGround = true;
			alarm[1] = _timer;
			
			// Cambio currentDrillCycle
			if keyRight { currentDrillCycle = 1; }
			else if keyLeft { currentDrillCycle = 2; }
			
			// Activate horizontalCycle
			horizontalCycle = true;
			
		}
	}
	
	// Else if horizontalDirection isn't zero, initiate single-block movement cycle
	else if (horizontalDirection != 0)
	{
		horizontalCycle = true;
	}
	
	// Activacion de horizontalDrilling cuando se usa el taladro hacia el lado, y HAY tierra
	// PREVENCIÓN BUG: Se copió y pego desde 'Vertical Movement' para el bug donde si se
	// excavaba hacia al lado UN ESPACIO y luego inmediatamente hacia arriba se producia el bug
	// donde era posible saltarse un espacio de aire. Los otros casos similares 
	// de este bug se cubren en 'Salto De-Lado-Hacia-Arriba' mas abajo.
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
	// DEBUGGING
	//if (place_meeting(x+horizontalDirection*global.squareSize, y, oGround) &&
	//	movementCounter == global.squareSize / movementSpeed - 1 )
	//	{
	//		sdm("bananan");
	//	}
	// FIN DEBUGGING
	
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
		
		// Indicate cycle ended during this frame.
		// Used in oDrill.myCycle
		// **CORRECCION DE BUG**: Sirve ara evitar que en oDrill se destruya un bloque
		// sin moverse si se detiene el uso del taladro en el último frame de
		// horizontalCycle.
		isHorCycleOverThisFrame = true;
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
	// esta cond. setea justDestroyedGround en False para que sección 'Cambio en fallSpeed' no cambie
	// el movimiento vertical hacia arriba, activando un erroneo verticalCycle en 'Activacion
	// verticalCycle'. Esto producia la posibilidad de usar el mov. hor. para saltarse un espacio
	// hacia arriba.
	var _isGroundAbove = place_meeting(x, y - global.squareSize, oSolid);
	if (!_isGroundAbove && horizontalDrilling && lastCurrentDrillCycle == 3)
	{
		justDestroyedGround = false;
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


//// Variables "lastFrame" (para tener info de la frame anterior durante la proxima frame)
//-----------------------------------------------------------
// 1) Variables Direccionales + Espacio
// a. Raw
lastRawKeyRight = rawKeyRight;
lastRawKeyLeft = rawKeyLeft;
lastRawKeyUp = rawKeyUp;
lastRawKeyDown = rawKeyDown;
lastRawKeySpace = rawKeySpace;

// b. Normales
lastKeyRight = keyRight;
lastKeyLeft = keyLeft;
lastKeyUp = keyUp;
lastKeyDown = keyDown;
lastKeySpace = keySpace;

// 2) Otras Variables lastFrame
lastCurrentDrillCycle = currentDrillCycle;