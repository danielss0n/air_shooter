#region GET ENEMY STATS
	name = ds_list_find_value(global.enemies, 0)[?"name"];
	move_speed = ds_list_find_value(global.enemies, 0)[?"move_speed"];
	max_hp = ds_list_find_value(global.enemies, 0)[?"max_hp"];
	current_hp = ds_list_find_value(global.enemies, 0)[?"max_hp"];
	coins_quantity = ds_list_find_value(global.enemies, 0)[?"coins_quantity"];
	touch_damage = ds_list_find_value(global.enemies, 0)[?"touch_damage"];
#endregion


deegres_deviation = 10 * global.room_speed; //get deviation
//multiply by -1 for the two directions
accuracy_deviation = random_range(deegres_deviation * -1, deegres_deviation);

//50% chance of spawn in left or right
random_side = random(int64(100)); 
x = random_side >= 50 ? 0 : room_width; 
	
//spawn random coordinate halfway up the window
y = random_range(0, room_height/2); 

//sum direction with deviation
direction = point_direction(x, y, global.player_x+accuracy_deviation, global.player_y+accuracy_deviation);
	
image_yscale = -1; //invert y image
ds_list_add(global.enemies_in_screen, self);