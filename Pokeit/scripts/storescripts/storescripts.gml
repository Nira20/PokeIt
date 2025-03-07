function createStore(){
inventory_slots = 0
rowLength =1;
randomize()
scroll_speed = 2; 
y_pos = room_height/3 

inventory = [
//[name, intitial quanity, sprite, base price, effect]
    ["Price Up", 0 , spr_priceUp],
    ["Helpers", 0, spr_apprenticeSticks],
    ["Slimes", 1, spr_slimebase],
 
];


mouseX = mouse_y
mouseY = mouse_x

button_pressed = false
is_hovered = false

sx = room_width/2
sy = room_height/3

image_xscale = 1
image_yscale = 1

spr = spr_button
}

function drawCurrentInventory(){
	inventory_slots = array_length(inventory);
	
draw_sprite_stretched(spr_button,
0,
55,
	room_height/3 +30,
	room_width/2 -50,
	12+(((inventory_slots -1)div rowLength)+1)*36);
	
	
	
for (var i =0; i < inventory_slots ; i++)
{var xx = 60+(i mod rowLength ) * 36 +2;
var yy = room_height/3 +(i div rowLength) * 36 + 2;

	if inventory[i] != -1
{

draw_text(xx-5 ,yy+5 +(16) ,string(inventory[i]))




}
}
}
function drawInventory(){
	inventory_slots = array_length(inventory);
draw_sprite_stretched(spr_button,
0,
50,
	room_height/3,
	room_width/2 -50,
	12+(((inventory_slots -1)div rowLength)+1)*36);

for (var i = 0; i < array_length(inventory); i++) {
	
	var xx = 60+(i mod rowLength ) * 36 +2;
	var yy = room_height/3 +(i div rowLength) * 36 + 2;
    draw_sprite_ext(inventory[i][2], 0, xx, yy,.5,.5,0,c_white,1);
    draw_text(xx +64 , yy, string(inventory[i][0]) + " - " + string(inventory[i][1]));
    }}