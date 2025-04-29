function drawRadial(){
draw_set_color(c_black)
draw_circle(tr_mid_x ,( tr_mid_u_y *1.5) +50, 52,0)
draw_set_color(c_white)
//this is the green circle 
draw_radial_progress(tr_mid_x ,( tr_mid_u_y *1.5) +50, platformHPPercent, 50, hcolor, 50);
draw_sprite_ext(spr_danger,0,tr_mid_x,tr_mid_y /2+50,3, 3,0,c_red,1)

draw_radial_progress(tr_mid_x , tr_mid_y /2 +50, danger, 50, c_red, 10);


}