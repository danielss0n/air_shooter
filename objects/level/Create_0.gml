sprite_size = sprite_get_width(s_enemy_01);

new_enemy = noone;

initial_x = random_range( 0, room_width );
initial_y = random_range( 0, room_height - room_height / 2 );

spawn_timer = 0;
spawn_delay = 10;

global.enemies_in_screen = [];
enemy_index = 0;
