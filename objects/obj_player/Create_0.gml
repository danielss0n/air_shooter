//set player
player = global.player;
hp = player.max_hp;
current_hp = hp;
move_speed = player.move_speed;

//set weapon
global.weapon_switch_cooldown = 0;
can_shoot = true;
bullet = noone;
timer_reload = 0;

global.kills = 0
//get right measures
player_mid_width = sprite_get_width(spr_player) / 2;
player_mid_height = sprite_get_height(spr_player) / 2;

current_weapon = global.current_weapon_data;
show_debug_message(current_weapon)
bullet_mid_width = current_weapon[?"bullet_size"][0] /2;
bullet_mid_height = current_weapon[?"bullet_size"][0] /2;
//bullet_mid_height = sprite_get_height(sprite_player) / 2;

global.player_width = sprite_width;
global.player_height = sprite_height;