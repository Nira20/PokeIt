

for(var i=0; i<= max(room_width, room_height); i+=64
) {
     draw_line(0, i, room_width, i);
     draw_line(i, 0, i, room_height);
}
