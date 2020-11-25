/// @desc

/// Initial Draw event variables
textSeqLength = array_length(textSequence); // Length of textSequence
if (textIndex < textSeqLength) { currText = textSequence[textIndex] }; // current text

if (textIndex < textSeqLength) 
{
	currTextHeight = string_height(textSequence[textIndex])
}; // String height for multiple lines

boxWidth = sprite_get_width(sTextbox); // Set width of bounding box

/// Drawing
// Draw textbox
draw_sprite(sTextbox, 0, x, y);

// Draw curr_text
draw_set_font(fTextbox); // Set font
draw_set_color(c_black);
draw_text_ext(x, y, currText, currTextHeight, boxWidth); // Draw text