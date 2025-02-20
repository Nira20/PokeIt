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
	
	function store_list
	{
		
	
	
	}