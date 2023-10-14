spawn_timer ++; //start counting

if ( spawn_timer >= spawn_delay ) {
	//create enemy instance
	new_enemy = instance_create_depth(0, 0, depth - 1, obj_kamikaze01);
    // Check if the instance was created successfully
    if (new_enemy != noone) {
        // Put the enemy in the array
        spawn_timer = 0; // Reset spawner time
        //enemy_index++;
    } 
}


global.out_screen_destroy(self)