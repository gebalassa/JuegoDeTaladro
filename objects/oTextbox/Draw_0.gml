/// @desc

/// Initial Draw event variables
textSeqLength = array_length(textSequence); // Length of textSequence
if (textIndex < textSeqLength)
{	
	// Current text
	currText = textSequence[textIndex];
	
	// String height for multiple lines
	currTextHeight = string_height(textSequence[textIndex]) - stringHeightReduction;
};

// Set width of bounding box MINUS a margin. Margin has to be multiplied by 2
// since the right-side margin is created by adding it to "x" in draw_text_ext()
// below.
boxWidth = sprite_get_width(sTextbox) - 2 * margin;

/// Drawing
// Draw textbox
draw_sprite(sTextbox, 0, x, y);

// Draw curr_text
draw_set_font(fTextbox); // Set font
draw_set_color(c_black);
draw_text_ext(x + margin, y + margin, currText, currTextHeight, boxWidth); // Draw text