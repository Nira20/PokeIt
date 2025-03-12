
// Step Event
// Make the sprite drift upwards
y -= 1;
var counter =0
counter ++

wiggle(wiggleFrecuency,wiggleAmpliitude)

var colorCounter = 0
alph -= .01
colorCounter ++
if alph <=0
{instance_destroy(self)}
if colorCounter >= 15 

{randomize();
	col = irandom_range(0,4)
	colorCounter =0}
	



switch(col) { // Use the item name from the inventory
        case 0:
            color = c_white
            break;

        case 1:
		color = c_red
            break;

        case 2:
          color = c_yellow
            break;

        case 3:
		color = c_purple
            break;

        case 4:
				
         color = c_teal
            break;

}