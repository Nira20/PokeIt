y -= 1;
var counter =0
counter ++

wiggle(wiggleFrecuency,wiggleAmpliitude)

var colorCounter = 0

colorCounter ++
var alphC =0

alphC ++
if alphC <=15
{alph -= .01}

if alph <=0
{instance_destroy(self)}
if colorCounter >= 15

{randomize();
	col = irandom_range(0,5)
	colorCounter =0}
	
if point_in_rectangle(x,y,obj_slime.x,obj_slime.y-68,sprite_get_width(spr_funnel),0)
{instance_destroy(self)}


switch(col) { // Use the item name from the inventory
        case 0:
            color = c_white
            break;

        case 1:
		color = #fff400
            break;

        case 2:
          color = #ffe802
            break;

        case 3:
		color = #ffce00
            break;

        case 4:
				
         color = #fdbf00
            break;
			
		case 5: 
		color = #ffb400
		break; 

}