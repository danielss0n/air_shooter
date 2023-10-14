player = global.player;
hp = player.max_hp;
current_hp = hp;
move_speed = player.move_speed;
global.kills = 0
	
//player backend

player_width = sprite_get_width(sprite_player);
player_height = sprite_get_height(sprite_player);
bullet_width = sprite_get_width(sprite_bullet_spark);
bullet_height = sprite_get_height(sprite_bullet_spark);
player_mid_w = player_width / 2;
player_mid_h = player_height / 2;
bullet_mid_w = bullet_width / 2;
bullet_mid_h = bullet_height / 2;
		
	
global.current_weapon = 0;
global.weapon_switch_cooldown = 0;
	
can_shoot = true;
bullet = noone;
timer_reload = 0;

