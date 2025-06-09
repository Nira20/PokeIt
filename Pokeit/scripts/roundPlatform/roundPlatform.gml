function createPlatforms() {
    global.activeNodes = 1;
    hpNodes = [
        // number, state, maxhp, currenthp, x, y
        [0, "active", 3, 3, -59, 21],
        [1, "inactive", 3, 3, 115, 21],
        [2, "inactive", 3, 3,- 21, 59],
        [3, "inactive", 3, 3, 154, 60],
        [4, "inactive", 3, 3, 0, 0], // Default x,y to prevent errors
        [5, "inactive", 3, 3, 0, 0],
        [6, "inactive", 3, 3, 0, 0],
        [7, "inactive", 3, 3, 0, 0]
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
            var yy =start_y + sin(angle) * radius;
                 
            draw_sprite(spr_inactiveNode, 0, xx, yy);
        }
    }

	function calculateMaxHP(){
	
	}
	function drawPlatform(){
	var x_pos =xm
	var y_pos =room_width *.4
	
	}
	
	function nodeSwitch(){
		switch ( hpNodes[1,i]) {
		case "active":
		nspr = spr_activeNode
		break;
	
	case "inactive":
		nspr = spr_inactiveNode
		break;
	
	case "broken":
	nspr = spr_inactiveNode
	break;
		}}