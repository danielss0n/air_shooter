//check collision between player and coin
if (place_meeting(x, y, obj_player)) {
	//destroy destroy coin obj and sum player stats
	instance_destroy(self); 
	global.player.match_coins += 1; 
}

//always move down
y += move_speed * global.room_speed;

#region CURVE ANIMATION

	curve_position += curve_speed;
	var curve_struct = animcurve_get(curve_asset); //get the animation 
	var channel = animcurve_get_channel(curve_struct, "x"); //get the channel
	
	//current value of x in the animation
	var current_value = animcurve_channel_evaluate(channel, curve_position); 
	
	//this will subtract the 1 with current value, if animation finishes, will be 0
	var animation_speed_multiplier = 1 - current_value;
	//so 1 will be decreasing and multiplying with move_speed, until stops
	x += lengthdir_x(distance_move * animation_speed_multiplier, direction);
	y += lengthdir_y(distance_move * animation_speed_multiplier, direction);
	
#endregion

out_screen_destroy(self);