global.weapons = ds_list_create();
global.enemies = ds_list_create();
var weapons_array = [];
var enemies_array = [];

weapon_base = {
	name: "",
	move_speed: 0,
	fire_rate: 0,
	magazine: 0,
	reload_time: 0,
	accuracy_deviation_in_degrees: 0,
	projectiles_quantity: 0
};

#region player data

	global.player = {
		name: "Jorge",
		max_hp: 100,
		move_speed: 2,
	}

#endregion

#region enemies data

	var basic_enemy = ds_map_create();
		basic_enemy[?"name"] = "Basic Enemy";
		basic_enemy[?"move_speed"] = 5;
		basic_enemy[?"spawn_type"] = "up"; //sides, up
	array_push( enemies_array, basic_enemy )
	
	var sides_enemy = ds_map_create();
		sides_enemy[?"name"] = "Basic Enemy";
		sides_enemy[?"move_speed"] = 3;
		sides_enemy[?"spawn_type"] = "sides"; //sides, up
	array_push( enemies_array, sides_enemy )
	
#endregion

#region guns data

	var basic_canon = ds_map_create();
		basic_canon[?"name"] = "Basic Canon";
		basic_canon[?"move_speed"] = 15;
		basic_canon[?"fire_rate"] = 13;
		basic_canon[?"magazine"] = 5;
		basic_canon[?"current_magazine"] = basic_canon[?"magazine"];
		basic_canon[?"reload_time"] = 1;
		basic_canon[?"accuracy_deviation_in_degrees"] = 3;
		basic_canon[?"projectiles"] = 1;
	array_push( weapons_array, basic_canon )
	
	var basic_shotgun = ds_map_create();
		basic_shotgun[?"name"] = "Basic Shotgun";
		basic_shotgun[?"move_speed"] = 15;
		basic_shotgun[?"fire_rate"] = 26;
		basic_shotgun[?"magazine"] = 5;
		basic_shotgun[?"current_magazine"] = basic_shotgun[?"magazine"];
		basic_shotgun[?"reload_time"] = 2;
		basic_shotgun[?"accuracy_deviation_in_degrees"] = 30;
		basic_shotgun[?"projectiles"] = 7;
	array_push( weapons_array, basic_shotgun )
	
	var submachine = ds_map_create();
		submachine[?"name"] = "Submachine Gun";
		submachine[?"move_speed"] = 18;
		submachine[?"fire_rate"] = 4;
		submachine[?"magazine"] = 30;
		submachine[?"current_magazine"] = submachine[?"magazine"];
		submachine[?"reload_time"] = 2;
		submachine[?"accuracy_deviation_in_degrees"] = 10;
		submachine[?"projectiles"] = 1;
	array_push( weapons_array, submachine )
	
#endregion 

for (var i = 0; i < array_length(weapons_array); i++) {
    ds_list_add(global.weapons, weapons_array[i]);
}

for (var i = 0; i < array_length(enemies_array); i++) {
    ds_list_add(global.enemies, enemies_array[i]);
}