spawn_timer ++;
//get random cordinates of the window
var random_x = random_range( 0 - sprite_size / 2, room_width + sprite_size / 2 );
var random_y = random_range( 0 - sprite_size / 2, room_height / 2 - 100 );

if ( spawn_timer >= spawn_delay ) {
	
	//create enemy instance
	new_enemy = instance_create_depth( 0, 0, depth - 1, basic_enemy_obj );
	
	//put enemy in the array
	array_push(global.enemies_in_screen, new_enemy);
	
	spawn_timer = 0; //reset spawner time
	enemy_index ++;
	
}

if (array_length(global.enemies_in_screen) > 0) {
    // Acesse o primeiro elemento do array
    var firstEnemy = array_get(global.enemies_in_screen, 0);
	
} else {
    // O array está vazio, faça algo apropriado neste caso
}



global.out_screen_destroy(self)