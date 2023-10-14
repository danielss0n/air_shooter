no_hp_destroy(self);
out_screen_destroy(self);

//move the enemy
x += lengthdir_x(move_speed, direction);
y += lengthdir_y(move_speed, direction);

show_debug_message(self)