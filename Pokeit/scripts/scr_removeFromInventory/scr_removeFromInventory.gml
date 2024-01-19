// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_removeFromInventory(itemName, quantity){
			var index = ds_list_find_index
			(global.playerInventory, itemName);
				if (index != -1)
	{ var currentQuantity = ds_list_find_value(global.playerInventory, index +1)
		
		if (quantity >= currentQuantity) {
		//remove the item from the inventory if the quantity is greater
		ds_list_delete(global.playerInventory, index +1);
		ds_list_delete(global.playerInventory, index);
		} else if currentQuantity > quantity{
		//update the quantity otherwise
		ds_list_replace(global.playerInventory, index +1, currentQuantity - quantity) ;
		} else ds_list_replace(global.playerInventory, index +1,0) ;
	
	}
}