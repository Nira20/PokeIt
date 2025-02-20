/// @description Insert description here
// You can write your code in this editor

if keyboard_check_released(ord("I")) && !inventoryOpen {
  inventoryOpen = true;
  if !instance_exists(obj_storeGui)
  instance_create_depth(0,0,100,obj_storeGui)
} else 
{ inventoryOpen = false}


