#region player stats

	player = global.player;
	hp = player.max_hp;
	move_speed = player.move_speed;
	global.kills = 0
	
#endregion

#region player backend

	#region sprite size
	
		player_width = sprite_get_width(sPlayer);
		player_height = sprite_get_height(sPlayer);
		bullet_width = sprite_get_width(sBullet);
		bullet_height = sprite_get_height(sBullet);

		player_mid_w = player_width / 2;
		player_mid_h = player_height / 2;
		bullet_mid_w = bullet_width / 2;
		bullet_mid_h = bullet_height / 2;
		
	#endregion
	
	global.current_weapon = 0;
	global.weapon_switch_cooldown = 0;
	
	can_shoot = true;
	bullet = noone;
	timer_reload = 0;
	
	//player_weapons = ds_list_find_value(global.weapons);
	
	
#endregion

