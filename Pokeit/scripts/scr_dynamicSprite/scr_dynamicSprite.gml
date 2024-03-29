// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dynamicSprite(sprite, size){
	

// Define the sprite to draw 
var spriteToDraw = spr_slimebase;

// Define the base size of the sprite
var baseSize = size; // Adjust this to your preferred base size

// Calculate the size multiplier based on the player's score
var sizeMultiplier = global.slimescore * .01;

// Calculate the final size of the sprite
var finalSize = (baseSize * sizeMultiplier);
draw_set_font (fn_arialBig)

// Draw the sprite at arcane bases center with the calculated size
draw_sprite_stretched(spriteToDraw, 1, x,y, finalSize, finalSize);


}