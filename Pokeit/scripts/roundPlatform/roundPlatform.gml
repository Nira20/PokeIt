function createPlatforms(){
	global.activeNodes =1 
	hpNodes = [
 	// number, state, maxhp, currenthp,x,y			
    [0,"active",3,3 ],
	[1,"inactive",3,3 ],
	[2,"inactive",3,3 ],
	[3,"inactive",3,3 ],
	[4,"inactive",3,3 ], 
	[5,"inactive",3,3 ], 
	[6,"inactive",3,3 ], 
	[7,"inactive",3,3 ]
	
];}
	function eyeLocation(){


// Calculate position for spr_inactiveNode (top middle)
var node_x = platform_x;
var node_y = platform_y - (sprite_get_height(spr_arcanePlatform) / 2) - (sprite_get_height(spr_inactiveNode) / 2);

draw_sprite(spr_inactiveNode, 0, node_x, node_y);


	
	
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