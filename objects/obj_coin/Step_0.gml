//check collision between player and coin
if (place_meeting(x, y, obj_player)) {
	instance_destroy(self); //destroy destroy coin obj
	global.player.match_coins += 1;
}

x -= move_speed * x_direction;
y += move_speed;

out_screen_destroy(self);