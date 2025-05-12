function background(){
var rectangle_width = xr * .0250
var rectangle_height = yb * .0250

var c1 = c_burntCienna
var c2 = c_brightGold

draw_rectangle_color(0,0,xr,rectangle_height,c2,c2,c2,c2,0)
draw_rectangle_color(0,yb,xr,yb - rectangle_height,c2,c2,c2,c2,0)
draw_rectangle_color(0,0,0 + rectangle_width ,yb,c2,c2,c2,c2,0)
draw_rectangle_color(xr,0,xr - rectangle_width ,yb,c2,c2,c2,c2,0)

draw_set_alpha(.6)
draw_rectangle_color  (0,0,xr,yb,c1,c1,c1,c1,0)
draw_set_alpha(1)
draw_set_color(c_dustyRose)
draw_line_width(0,0,xr,0,4);
draw_line_width(0,0,0,yb,4);
draw_line_width(0,yb- 3,xr,yb - 3,4)
draw_line_width(xr-3 ,0,xr-3,yb,4)
draw_set_color(c_white) 
 
  
}

function draw_points_in_rectangle(x1, y1, x2, y2) {
    draw_set_color(c_white);
    
    var w = (x2 - x1) / 3;
    var h = (y2 - y1) / 3;

    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 2; j++) {
            draw_point(x1 + (i * w), y1 + (j * h));
        }
    }
}


function draw_points_grid(x1, y1, x2, y2) {
    draw_set_color(c_white);
    
    var w = (x2 - x1) / 2;
    var h = (y2 - y1) / 2;

    for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
            var px = x1 + (i * w);
            var py = y1 + (j * h);
            draw_point(px, py);
        }
    }
}
