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
    var radius = (sprite_get_height(spr_arcanePlatform)/2)  -16

	

	draw_sprite(spr_arcanePlatform, 0, start_x, start_y);
    for (var i = 0; i < 8; i++) {
		  var angle =(i / 8) *2 * pi  + degtorad(22.5)
        var xx = start_x + cos(angle) * radius;
var yy = start_y + sin(angle) * radius;
var active = shockNodes[i][1]; 
var spriteToDraw = active ? spr_activeNode: spr_inactiveNode ; 
draw_sprite(spriteToDraw, 0, xx, yy);
lightning(angle,xx,yy,active,radius)
        }
    }

	function lightning(angle, xx, yy, active, radius) {
    if (global.shock && active) { 
        var activeCount = 0;

        // Count active shock nodes
        for (var i = 0; i < array_length(shockNodes); i++) {
            if (shockNodes[i][1] == 1) {
                activeCount += 1;
            }
        }

        // Generate lightning effect for each active node
        for (var i = 0; i < activeCount; i++) {
     

         
        
    

   

         
       
          
	draw_lightning_continuous(
x, y, xx,yy,
    c_brightCyan,        // color1 - Bright starting color
    c_paleGold,       // color2 - Electric yellow glow at the tips
    0.2, 0.8,       // alpha1, alpha2 - Makes parts of lightning more transparent
    2, 4,           // minSize, maxSize - Varying thickness for realism
    angle, irandom_range(0,45),         // angle1, angle2 - Allows dramatic arcs
    2            // numLines - Mult iple lightning bolts for intensity
);
global.shock = false

}}}