var list_length = ds_list_size(global.enemies_in_screen); 

//loop through the list of enemies in screen and delete the one collided to bullet
for (var i = 0; i < list_length; i++) {
    var enemy_instance = ds_list_find_value(global.enemies_in_screen, i); //find enemy instance
	
	//check collision of this bullet with the enemy instance
    if (place_meeting(x, y, enemy_instance)) {
		enemy_instance.current_hp -= damage;
		instance_destroy(self); break; //destroy this bullet and stop loop
    }
}


//move the bullet
x += lengthdir_x(move_speed, direction + accuracy_deviation);
y += lengthdir_y(move_speed, direction + accuracy_deviation);

current_distance_travelled += move_speed; //sum the travelled distance of bullet

//destroy bullet if pass the distance travel var
if (current_distance_travelled >= travel_distance) {
    instance_destroy(); //destroy instance
}

if(weapon_name = "Shotgun fodase"){
	instance_create_depth(x-sprite_width/2, y+sprite_height/2, depth-5, obj_explosion);
}

//delete if left off screen
out_screen_destroy(self);