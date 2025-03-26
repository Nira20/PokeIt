/// @description Creates the variables to spawn in
// create slime and base tables
instance_create_depth(x,y,depth -10, obj_slime)
globalVars();
x=room_width/2
y=room_height/3
inventoryOpen = false
playerMoney = 0;
spentMoney= 0;
totalMoney = 0

createStore();

debugging = instance_number(obj_slime)