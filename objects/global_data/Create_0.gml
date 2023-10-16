global.weapons = ds_list_create();
global.enemies = ds_list_create();
global.enemies_in_screen = ds_list_create(); 
global.current_weapon = 0;

var weapons_array = [];
var enemies_array = [];

global.game_mode = 0; //0 keyboard, 1 mouse

//player data
global.player = {
	name: "Jorge",
	max_hp: 99999,
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
		enemy_kamikaze[?"move_speed"] = 4;
		enemy_kamikaze[?"touch_damage"] = 50;
		enemy_kamikaze[?"max_hp"] = 100;
		enemy_kamikaze[?"coins_quantity"] = 2;
	array_push( enemies_array, enemy_kamikaze );
	
#endregion

#region WEAPONS DATA 
	
	var test_weapon = ds_map_create();
		test_weapon[?"name"] = "Shotgun test";
		test_weapon[?"bullet_sprite"] = spr_bullet_basic;
		
		test_weapon[?"automatic"] = false;
		test_weapon[?"magazine"] = 999;
		test_weapon[?"current_magazine"] = test_weapon[?"magazine"];
		test_weapon[?"reload_time"] = 1;
		
		test_weapon[?"fire_rate"] = 30;		
		test_weapon[?"projectiles"] = 12;
		test_weapon[?"move_speed"] = 14;
		test_weapon[?"accuracy_deviation"] = 40;		
		
		test_weapon[?"damage"] = [5, 30];
		test_weapon[?"bullet_size"] = [1, 2];
		test_weapon[?"travel_distance"] = [900, 900];
		
	array_push( weapons_array, test_weapon );
	
	var basic_canon = ds_map_create();
	
		basic_canon[?"name"] = "Basic Canon";
		basic_canon[?"automatic"] = false;
		basic_canon[?"fire_rate"] = 20;		
		basic_canon[?"projectiles"] = 1;
		basic_canon[?"move_speed"] = 10;
		basic_canon[?"accuracy_deviation"] = 9;		

		basic_canon[?"magazine"] = 20;
		basic_canon[?"current_magazine"] = basic_canon[?"magazine"];
		basic_canon[?"reload_time"] = 1;
		basic_canon[?"bullet_sprite"] = spr_bullet_basic;
		
		basic_canon[?"damage"] = [5, 30];
		basic_canon[?"bullet_size"] = [1, 1];
		basic_canon[?"travel_distance"] = [300, 400];
		
	array_push( weapons_array, basic_canon );
	
	var basic_shotgun = ds_map_create();
		basic_shotgun[?"name"] = "Basic Shotgun";
		basic_shotgun[?"automatic"] = false;
		basic_shotgun[?"fire_rate"] = 14;
		basic_shotgun[?"projectiles"] = 9;
		basic_shotgun[?"move_speed"] = 20;
		basic_shotgun[?"accuracy_deviation"] = 20;

		basic_shotgun[?"magazine"] = 999;
		basic_shotgun[?"current_magazine"] = basic_shotgun[?"magazine"];
		basic_shotgun[?"reload_time"] = 3;
		basic_shotgun[?"bullet_sprite"] = spr_bullet_basic;
		
		basic_shotgun[?"damage"] = [5, 30];
		basic_shotgun[?"bullet_size"] = [.9, 1.2];
		basic_shotgun[?"travel_distance"] = [300, 400];

	array_push( weapons_array, basic_shotgun );
	
	var submachine = ds_map_create();
		submachine[?"name"] = "Submachine Gun";
		submachine[?"automatic"] = true;
		submachine[?"fire_rate"] = 0;
		submachine[?"projectiles"] = 1;
		submachine[?"move_speed"] = 18;
		submachine[?"accuracy_deviation"] = 0;
		submachine[?"magazine"] = 40;
		submachine[?"current_magazine"] = submachine[?"magazine"];
		submachine[?"reload_time"] = 2;
		submachine[?"bullet_sprite"] = spr_bullet_basic;
		
		submachine[?"damage"] = [5, 20];
		submachine[?"bullet_size"] = [.5, 1.2];
		submachine[?"travel_distance"] = [500, 900];
		
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

global.current_weapon_data = ds_list_find_value(global.weapons, global.current_weapon);