//get gun stats from the global_data step event
weapon_name = global.current_weapon_weapon_name
move_speed = global.current_weapon_move_speed;
fire_rate = global.current_weapon_fire_rate;
magazine = global.current_weapon_magazine;
reload_time = global.current_weapon_reload_time;
accuracy_deviation_in_degrees = global.current_weapon_accuracy_deviation_in_degrees;
projectiles_quantity = global.current_weapon_projectiles_quantity;
min_damage = global.current_weapon_min_damage;
max_damage = global.current_weapon_max_damage;

//sprite stats
sprite_index = ds_list_find_value(global.weapons, global.current_weapon)[?"bullet_sprite"];
min_size = global.current_weapon_min_size;
max_size = global.current_weapon_max_size;
size_variation = random_range(min_size, max_size);
image_xscale = size_variation; image_yscale = size_variation;

//get the direction that the bullet will move
//direction = point_direction( x, y, global.adjusted_x, global.adjusted_y );
direction = 90;

//bullet accuracy
accuracy_deviation = random_range(accuracy_deviation_in_degrees*-1, accuracy_deviation_in_degrees);
exact_direction = point_direction( x, y, global.adjusted_x, global.adjusted_y);
image_angle = exact_direction + accuracy_deviation;

rate_timer = 0;