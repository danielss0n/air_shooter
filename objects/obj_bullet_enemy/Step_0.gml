y+=move_speed;

if(place_meeting(x, y, obj_player)){
	instance_create_depth(global.player_x, global.player_y, -5, obj_explosion)	
}