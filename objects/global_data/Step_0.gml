#region WEAPONS
global.current_weapon_weapon_name = ds_list_find_value(global.weapons, global.current_weapon)[?"name"];
global.current_weapon_move_speed = ds_list_find_value(global.weapons, global.current_weapon)[?"move_speed"];
global.current_weapon_fire_rate = ds_list_find_value(global.weapons, global.current_weapon)[?"fire_rate"];
global.current_weapon_magazine = ds_list_find_value(global.weapons, global.current_weapon)[?"magazine"];
global.current_weapon_reload_time = ds_list_find_value(global.weapons, global.current_weapon)[?"reload_time"];
global.current_weapon_accuracy_deviation_in_degrees = ds_list_find_value(global.weapons, global.current_weapon)[?"accuracy_deviation_in_degrees"];
global.current_weapon_projectiles_quantity = ds_list_find_value(global.weapons, global.current_weapon)[?"projectiles_quantity"];
global.current_weapon_min_size = ds_list_find_value(global.weapons, global.current_weapon)[?"min_size"];
global.current_weapon_max_size = ds_list_find_value(global.weapons, global.current_weapon)[?"max_size"];
global.current_weapon_min_damage = ds_list_find_value(global.weapons, global.current_weapon)[?"min_damage"];
global.current_weapon_max_damage = ds_list_find_value(global.weapons, global.current_weapon)[?"max_damage"];
#endregion

//delete object after reaching the limit of window size