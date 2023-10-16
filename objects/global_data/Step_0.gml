//set all gun data in the current in-step-game weapon that player is using
global.current_weapon_data = ds_list_find_value(global.weapons, global.current_weapon);