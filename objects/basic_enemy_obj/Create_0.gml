move_speed = ds_list_find_value(global.enemies, 0)[?"move_speed"];
spawn_type = ds_list_find_value(global.enemies, 0)[?"spawn_type"];
move_dir = 0;

//x = random( room_width );
x = 300;
y = 0;

image_yscale = -1;

if ( spawn_type == "sides" ) {
	//if enemy spawned in left side, move to right
	if ( x + room_width / 2 ) {
		move_dir = 1;
	}
	
	//if enemy spawned in right side, move to left
	if ( x - room_width / 2 ) {
		move_dir = -1;
	}
	
}
/*
//loop in the array for get the right index
	for (var i = 0; i < array_length(global.enemies_in_screen); i++) {
		//and delete if the instance exists in the array
		if (array_get(global.enemies_in_screen, i) == id) {	
			array_delete(global.enemies_in_screen, i, 1);
			break;
		}
	}