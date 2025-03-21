//create events

function slimeCreate(){
spriteWidth = sprite_width
spriteHeight= sprite_height
button_pressed = false
sizeMultiplier =0

image_speed = .25
depth = -1
autoClickerSetup()

createAnger()

}
function createSlider(){

// obj_slider Create Event
slider_max = 100; // Maximum value for the slider
slider_value = 0; // Initial value of the slider


}
function createAnger(){
angerMax =100
angerTimer = 0


}
	
//draw Events
function drawSlider()

{
	// obj_slider Step Event
slider_value = global.Counter;

// Ensure the slider value does not exceed the maximum
if (slider_value > slider_max) {
    slider_value = slider_max;
}

	
	// obj_slider Draw Event
var slider_width = 200; // Width of the slider bar
var slider_height = 20; // Height of the slider bar
var x1 =x -32
var y1 = y +32

// Draw the background of the slider
draw_set_color(c_black);
draw_rectangle(x1,y1, x1 + slider_width, y1 + slider_height, false);

// Draw the filled part of the slider
var fill_width = (slider_value / slider_max) * slider_width;
draw_set_color(c_green);
draw_rectangle(x1, y1, x1 + fill_width, y1 + slider_height, false)
draw_set_color(c_white)
}
function drawPlatforms(){
draw_self()
draw_sprite_ext(spr_funnel,0,x,y-86,3,3,0,c_white,1)
draw_sprite_ext(spr_arcanePlatform,0,x,y,global.pXScale,global.pYScale,0,c_white,1)
}
// Step events
function angerGenerate(){
	angerTimer ++ 
	if angerTimer >= angerMax{
	angerTimer =0
	global.Counter += global.angerCounter
	}
angerTimer = 0

}
function sizeUpdate(){
x =room_width/2
y =room_width *.4
sizeMultiplier = 4 + (global.slimeSizeCounter * .01)
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier

}


function slimeAttack(){
global.platform -= global.slimeSizeCounter
}