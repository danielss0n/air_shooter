no_hp_destroy(self);
out_screen_destroy(self);

if(turn){
	if turn_side == +1 direction+=1;
	if turn_side == -1 direction-=1;
}

image_angle = direction
//move the enemy
x += lengthdir_x(move_speed * global.room_speed, direction);
y += lengthdir_y(move_speed * global.room_speed, direction);

