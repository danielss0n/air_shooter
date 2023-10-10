#region gun stats

	move_speed = ds_list_find_value(global.weapons, global.current_weapon)[?"move_speed"];
	fire_rate = ds_list_find_value(global.weapons, global.current_weapon)[?"fire_rate"];
	magazine = ds_list_find_value(global.weapons, global.current_weapon)[?"magazine"];
	reload_time = ds_list_find_value(global.weapons, global.current_weapon)[?"reload_time"];
	accuracy_deviation_in_degrees = ds_list_find_value(global.weapons, global.current_weapon)[?"accuracy_deviation_in_degrees"];
	projectiles_quantity = ds_list_find_value(global.weapons, global.current_weapon)[?"projectiles_quantity"];
	
#endregion


#region bullet backend

	current_magazine = magazine

	#region fire rate
	
		rate_timer = 0;
		
	#endregion
	
	#region bullet accuracy
	
		left_deviation = accuracy_deviation_in_degrees * -1;
		right_deviation = accuracy_deviation_in_degrees * 1;
		
		accuracy_deviation = random_range(left_deviation, right_deviation);
		
	#endregion
	
#endregion