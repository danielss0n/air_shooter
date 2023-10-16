#region GUN STATS
	//get gun stats from the global_data step event
	weapon = global.current_weapon_data
	weapon_name = weapon[?"name"]
	bullet_sprite = weapon[?"bullet_sprite"];
	move_speed = weapon[?"move_speed"];
	fire_rate = weapon[?"fire_rate"]; rate_timer = 0;
	magazine = weapon[?"magazine"];
	reload_time =  weapon[?"reload_time"];
	accuracy_deviation = weapon[?"accuracy_deviation"];
	projectiles_quantity = weapon[?"projectiles_quantity"];
	bullet_size = array_get_random( weapon[?"bullet_size"] );
	damage = array_get_random( weapon[?"damage"] );
	travel_distance = array_get_random( weapon[?"travel_distance"] );
	
#endregion

#region SPAWN IN MIDDLE CALCULUS

	//move to center of player
	x = global.player_x+global.player_width/2-bullet_size;
	
	//get width of this bullet based in sprite width and bullet size variation
	bullet_width = bullet_size*sprite_width/2; 
	bullet_height = bullet_size*sprite_height/2;
	
	//divide the bullet size and move cordinates to middle
	if bullet_size>=1 x-=bullet_width/2; else x-=bullet_width/2;
	if bullet_size>=1 y+=bullet_height/2; else y+=bullet_height/2;
	
#endregion

current_distance_travelled = 0; //will count the distance traveled

//get directions
mouse_direction = point_direction(x, y, global.adjusted_x, global.adjusted_y); 
up_direction = 90;

//if game_mode = 0, point always up, if 1 then point to mouse coordinates
direction = global.game_mode == 1 ? direction = mouse_direction : direction = up_direction;

//direction bullet will move
accuracy_deviation = random_range( accuracy_deviation*-1 , accuracy_deviation );
image_angle = direction + accuracy_deviation;

//sprite create
sprite_index = bullet_sprite;
image_xscale = bullet_size; 
image_yscale = bullet_size;
depth = 2;