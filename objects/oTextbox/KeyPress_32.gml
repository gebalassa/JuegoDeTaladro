/// @desc

// Increase textIndex
if (textIndex < textSeqLength - 1)
{
	textIndex += 1;
}

// if last text already on display, destroy self.
else
{
	instance_destroy();
}