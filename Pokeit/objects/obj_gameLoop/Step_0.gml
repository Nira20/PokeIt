/// @description Insert description here
// You can write your code in this editor
totalMoney = global.Counter
playerMoney = totalMoney - spentMoney

checkContainment()
updatePacify()

if keyboard_check_released(ord("I")) {
    visable = !visable;
	othr = false
}

if keyboard_check_released(vk_escape){
setToInvisable()
othr = false
}
