function inventorySearch(rootObject,itemType)
{
	for (var i=0; i < inventory_slots; i ++;)
		{
		if rootObject.inventory[i] == itemType
		{ return(i)
		}
		}
		return(-1);


}

function inventoryRemove (rootObject, itemType)
{var _slot = inventorySearch(rootObject, -1);
	if (_slot !=-1)
	{
	with(rootObject) inventory[_slot] =-1
	return true;
	}
	else return false;
	
	
}
	
function inventoryAdd (rootObject, itemType)
{var _slot = inventorySearch(rootObject, -1);
	if (_slot !=-1)
	{
	with(rootObject) inventory[_slot] =itemType;
	return true;
	}
	else return false;
	
	
}
	
function inventorySwap(objectFrom, slotFrom, objectTo, slotTo)
{var _itemFrom = objectFrom.inventory[slotFrom]
	objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
	objectTo.inventory[slotTo] = _itemFrom
	
}
	
function scr_buttonCheck(object,image_xscale,image_yscale)
{
//check if the left mouse button is pressed 

//debugging
draw_rectangle(mouse_x,mouse_y, mouse_x +60,mouse_y+60, 0)
var mouseX = mouse_x;
var mouseY = mouse_y;

	if (point_in_rectangle(mouseX, mouseY, x,y, x + image_xscale, y + image_yscale)) {
	//check if the mouse click is within the buttons area
	object.button_pressed = true 
	}
}	