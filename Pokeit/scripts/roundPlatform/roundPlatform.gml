function createPlatforms() {

    shockNodes = [
        // number, state
        [0, 1],
        [1, 0],
        [2,0],
        [3,0],
        [4,0], 
        [5, 0],
        [6, 0],
        [7, 0]
    ];
}

function eyeLocation() {
    var start_x = xm;
    var start_y = yb * 0.2;
    var radius = (sprite_get_height(spr_arcanePlatform)/2) -16
	draw_sprite(spr_arcanePlatform, 0, start_x, start_y);
    for (var i = 0; i < 8; i++) {
		  var angle =(i / 8) *2 * pi;
        var xx = start_x + cos(angle) * radius;
var yy = start_y + sin(angle) * radius;
var active = shockNodes[i][1]; 
var spriteToDraw = active ? spr_activeNode: spr_inactiveNode ; 
draw_sprite(spriteToDraw, 0, xx, yy);
           
        }
    }

	function calculateMaxHP(){
	
	}
	function drawPlatform(){
	var x_pos =xm
	var y_pos =room_width *.4
	
	}
	
	