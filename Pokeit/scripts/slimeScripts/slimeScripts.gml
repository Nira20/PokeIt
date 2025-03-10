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

// Draw the background of the slider
draw_set_color(c_black);
draw_rectangle(x,y, x + slider_width, y + slider_height, false);

// Draw the filled part of the slider
var fill_width = (slider_value / slider_max) * slider_width;
draw_set_color(c_green);
draw_rectangle(x, y, x + fill_width, y + slider_height, false)
draw_set_color(c_white)
}

function createSlider(){

// obj_slider Create Event
slider_max = 100; // Maximum value for the slider
slider_value = 0; // Initial value of the slider


}