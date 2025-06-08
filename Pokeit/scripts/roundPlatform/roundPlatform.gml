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
	
];
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