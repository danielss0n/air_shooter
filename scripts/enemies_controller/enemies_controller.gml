//check the hp and destroy instance
function no_hp_destroy(instance){
	if (instance.current_hp <= 0) { 
		//create an explosion instance
		instance_create_depth(instance.x, instance.y, depth-5, obj_explosion); 
	
		var instance_index = ds_list_find_index(global.enemies_in_screen, instance); 
		
		//check if is enemy, if not then the index is -1
		if(instance_index != -1){
			ds_list_delete(global.enemies_in_screen, instance_index) 
	
			//spawn the coins, this enemy as paramter
			spawn_coins(instance);
			//add match_kills in stats
			global.player.match_kills += 1; 
		}
		
		//destroy instance
		instance_destroy(instance);
	} 
}

//check coordinates and destroy if out of room
function out_screen_destroy(instance) {
	var instance_index = ds_list_find_index(global.enemies_in_screen, instance); 
	
	var plus_area_to_delete = 64;
	if (instance.x < - plus_area_to_delete ||
		instance.y < - plus_area_to_delete ||
		instance.x > room_width + plus_area_to_delete||
		instance.y > room_height + plus_area_to_delete) {
			
		instance_destroy(instance); //delete object
		
		//delete instance in the list
		ds_list_delete(global.enemies_in_screen, instance_index)
	}
}

//spawn coins if destroyed
function spawn_coins(instance) {
	//create the quantity of coins released
	for(var i = 0; i < instance.coins_quantity; i++){
		//create coins obj
		instance_create_depth(x, y, depth-1, obj_coin);
	}
}