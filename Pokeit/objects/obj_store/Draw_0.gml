draw_sprite_stretched(
spr_button,
0,
x+ 60,
y+120,
room_width/2,
room_height/3
);

for (var i =0; i < inventory_slots ; i++)
{
var xx = x+ 60+(i mod rowLength ) * 36;
var yy = y + 120+(i div rowLength ) * 36;
draw_text( xx , yy ,string(inventory[i]))

if inventory[i] != -1
{
	draw_text( xx, yy,string(inventory[i]))
}
}




