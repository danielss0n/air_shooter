var list_length = ds_list_size(global.enemies_in_screen); 

//loop through the list of enemies in screen and delete the one collided to bullet
for (var i = 0; i < list_length; i++) {
	//find enemy instance
    var enemy_instance = ds_list_find_value(global.enemies_in_screen, i); 
	
	//check collision of this bullet with the enemy instance
    if (place_meeting(x, y, enemy_instance)) {

		enemy_instance.current_hp -= max_damage;
        //do_damage(enemy_instance, i); //send instance to give damage
		instance_destroy(self); break; //destroy this bullet and stop loop
    }
}

//move the bullet
x += lengthdir_x(move_speed, direction + accuracy_deviation);
y += lengthdir_y(move_speed, direction + accuracy_deviation);

if(weapon_name = "Shotgun fodase"){
	//instance_create_depth(x-sprite_width/2, y+sprite_height/2, depth-5, obj_explosion);
}

//delete if left off screen
out_screen_destroy(self);