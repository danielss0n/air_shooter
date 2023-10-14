global.weapons = ds_list_create();
global.enemies = ds_list_create();
global.enemies_in_screen = ds_list_create(); 

var weapons_array = [];
var enemies_array = [];

global.game_mode = 0; //0 keyboard, 1 mouse

//player data
global.player = {
	name: "Jorge",
	max_hp: 100,
	move_speed: 2.2,
	total_coins: 0,
	match_coins: 0,
	total_kills: 0,
	match_kills: 0,
}

#region COINS DATA

	global.basic_coin = {
		name: "Basic Coin",
		money_value: 1,
	}
	
#endregion

#region ENEMIES DATA

	var enemy_kamikaze = ds_map_create();
		enemy_kamikaze[?"name"] = "Kamikaze";
		enemy_kamikaze[?"move_speed"] = 7;
		enemy_kamikaze[?"touch_damage"] = 50;
		enemy_kamikaze[?"max_hp"] = 100;
		enemy_kamikaze[?"coins_quantity"] = 1;
	array_push( enemies_array, enemy_kamikaze );
	
#endregion

#region WEAPONS DATA 
	
	var super_shotgun = ds_map_create();
		super_shotgun[?"name"] = "Shotgun fodase";
		super_shotgun[?"automatic"] = false;
		super_shotgun[?"fire_rate"] = 30;		
		super_shotgun[?"projectiles"] = 10;
		super_shotgun[?"move_speed"] = 20;
		super_shotgun[?"accuracy_deviation_in_degrees"] = 20;		
		super_shotgun[?"min_damage"] = 5;
		super_shotgun[?"max_damage"] = 30;	
		super_shotgun[?"magazine"] = 99;
		super_shotgun[?"current_magazine"] = super_shotgun[?"magazine"];
		super_shotgun[?"reload_time"] = 1;
		super_shotgun[?"bullet_sprite"] = sprite_bullet_spark;
		super_shotgun[?"min_size"] = .9;
		super_shotgun[?"max_size"] = 2.5;
	array_push( weapons_array, super_shotgun );
	
	var basic_canon = ds_map_create();
		basic_canon[?"name"] = "Basic Canon";
		basic_canon[?"automatic"] = false;
		basic_canon[?"fire_rate"] = 6;		
		basic_canon[?"projectiles"] = 1;
		basic_canon[?"move_speed"] = 50;
		basic_canon[?"accuracy_deviation_in_degrees"] = 2;		
		basic_canon[?"min_damage"] = 5;
		basic_canon[?"max_damage"] = 20;	
		basic_canon[?"magazine"] = 20;
		basic_canon[?"current_magazine"] = basic_canon[?"magazine"];
		basic_canon[?"reload_time"] = 1;
		basic_canon[?"bullet_sprite"] = sprite_bullet_spark;
		basic_canon[?"min_size"] = .95;
		basic_canon[?"max_size"] = 1;
	array_push( weapons_array, basic_canon );
	
	var basic_shotgun = ds_map_create();
		basic_shotgun[?"name"] = "Basic Shotgun";
		basic_shotgun[?"automatic"] = false;
		basic_shotgun[?"fire_rate"] = 14;
		basic_shotgun[?"projectiles"] = 9;
		basic_shotgun[?"move_speed"] = 20;
		basic_shotgun[?"accuracy_deviation_in_degrees"] = 20;
		basic_shotgun[?"min_damage"] = 5;
		basic_shotgun[?"max_damage"] = 30;
		basic_shotgun[?"magazine"] = 999;
		basic_shotgun[?"current_magazine"] = basic_shotgun[?"magazine"];
		basic_shotgun[?"reload_time"] = 3;
		basic_shotgun[?"bullet_sprite"] = sprite_bullet_spark;
		basic_shotgun[?"min_size"] = .6;
		basic_shotgun[?"max_size"] = 1.5;
	array_push( weapons_array, basic_shotgun );
	
	var submachine = ds_map_create();
		submachine[?"name"] = "Submachine Gun";
		submachine[?"automatic"] = true;
		submachine[?"fire_rate"] = 4;
		submachine[?"projectiles"] = 1;
		submachine[?"move_speed"] = 18;
		submachine[?"accuracy_deviation_in_degrees"] = 10;
		submachine[?"min_damage"] = 5;
		submachine[?"max_damage"] = 50;
		submachine[?"magazine"] = 40;
		submachine[?"current_magazine"] = submachine[?"magazine"];
		submachine[?"reload_time"] = 2;
		submachine[?"bullet_sprite"] = sprite_bullet_basic;
		submachine[?"min_size"] = .7;
		submachine[?"max_size"] = .7;
	array_push( weapons_array, submachine );
#endregion 

#region push datas into arrays

for (var i = 0; i < array_length(weapons_array); i++) {
	ds_list_add(global.weapons, weapons_array[i]);
}

for (var i = 0; i < array_length(enemies_array); i++) {
	ds_list_add(global.enemies, enemies_array[i]);
}

#endregion