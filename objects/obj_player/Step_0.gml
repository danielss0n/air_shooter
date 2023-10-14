#region MOVE
	//move directions
	var move_x = 0; //- left; + right
	var move_y = 0; //- down; + up

	//global player variables
	global.adjusted_x = mouse_x - player_mid_w;
	global.adjusted_y = mouse_y - player_mid_h;
	global.player_x = x;
	global.player_y = y;

	//controls	
	if ( keyboard_check_direct(ord("W")) ) { move_y -= move_speed };
	if ( keyboard_check_direct(ord("S")) ) { move_y += move_speed };
	if ( keyboard_check_direct(ord("A")) ) { move_x -= move_speed };
	if ( keyboard_check_direct(ord("D")) ) { move_x += move_speed };
	if ( keyboard_check_pressed(vk_space) ) { change_weapon() };
	
	//normalize diagonals
	if (move_x != 0 && move_y != 0) {
		var move_length = point_distance(0, 0, move_x, move_y);
		var magnitude = move_speed;

		move_x = move_x * (magnitude / move_length);
		move_y = move_y * (magnitude / move_length);
	}

	//stop moving when touch on the sides of window
	function move_limit() {
		if (x - image_xscale * sprite_width / 2 < 0 - sprite_width) {
			x = image_xscale * sprite_width / 2 - sprite_width;
		}
		if (x + image_xscale * sprite_width / 2 > room_width) {
			x = room_width - image_xscale * sprite_width / 2;
		}
		if (y - image_yscale * sprite_height / 2 < 0 - sprite_height) {
			y = image_yscale * sprite_height / 2 - sprite_height;
		}
		if (y + image_yscale * sprite_height / 2 > room_height ) {
			y = room_height - image_yscale * sprite_height / 2;
		}
	}

	//move the obj in the screen
	move_limit(); //check if is in limit of window
	x += move_x * move_speed;
	y += move_y * move_speed;	

#endregion 

#region WEAPON

	function change_weapon() {
		//delay for click
		var switch_delay = 15;
		//quantity of weapons in inventory
		var total_weapons = ds_list_size(global.weapons);
		//if delay passed, than chenge weapon
		if ( global.weapon_switch_cooldown <= 0 ) {
			//change weapon
		    global.current_weapon++;
			
			//reset if last weapon selected
		    if ( global.current_weapon >= total_weapons ) {
		        global.current_weapon = 0;
		    }
			//reset cooldown after change weapon
		    global.weapon_switch_cooldown = switch_delay;
		}
	}

	//cooldown repeater
	if (global.weapon_switch_cooldown > 0) {
		global.weapon_switch_cooldown--;
	}
	
	//get current weapon
	var weapon = ds_list_find_value(global.weapons, global.current_weapon);
	
	//if game mode keyboard, always shoot
	if(global.game_mode == 0){
		weapon[?"automatic"] = true;
		weapon[?"current_magazine"] = infinity;
	}
	
	//check if weapon is automatic
	if(global.game_mode == 1){
		if(weapon[?"automatic"]){
			//game_mode 1 with mouse
			if ( mouse_check_button(mb_left) ) { shoot(weapon) };
		} else {
			//only shoot once pressed
			if ( mouse_check_button_pressed(mb_left) ) { shoot(weapon) };
		}
	}
	
	//check if it has to reload
	if (weapon[?"current_magazine"] <= 0) {
		reload(weapon);
	}
	
	function reload(weapon){
		timer_reload ++;
		//miliseconds exceed the reload time, then reset times shooted
		if ( timer_reload >= weapon[?"reload_time"] * room_speed) {
			weapon[?"current_magazine"] = weapon[?"magazine"];
			timer_reload = 0;
		}
	}
	
	function shoot(weapon) {
		//if there is no bullets and it has to reload
		if (weapon[?"current_magazine"] > 0) {
			if ( !instance_exists(bullet) || can_shoot ) {
				create_bullets()
				//when false, rate_timer will start to count
				can_shoot = false; 
			}
		} 
	}

	//after shoot() function
	function create_bullets() {
		var projectiles =  ds_list_find_value(global.weapons, global.current_weapon)[?"projectiles"];
	
		for ( var i = 1; i <= projectiles; i ++ ) {
			//cordinates where bullets spawn
			var initial_x = x + player_mid_w - bullet_mid_w;
			var initial_y = y + player_mid_h - bullet_mid_h;
		
			//create obj
			bullet = instance_create_depth(initial_x, initial_y, depth-1, obj_bullet);
			bullet.direction = 90;
		}	
	
		//get the weapon by ds and subtract the values of current magazine
		var weapon = ds_list_find_value(global.weapons, global.current_weapon);
		weapon[?"current_magazine"] -= 1;
	}

	//fire rate delay
	if (instance_exists(bullet)) {
		//start counting miliseconds after can_shoot false
		if (!can_shoot) {
			bullet.rate_timer ++; //counting to shoot again
			//fire again based in the fire rate
			if (bullet.rate_timer >= bullet.fire_rate) {
				bullet.rate_timer = 0;
				can_shoot = true; //shoot() again and repeat process
			}
		}
	}

#endregion

//destroy player and enemy if both collide
var list_length = ds_list_size(global.enemies_in_screen); 

//for loop find the instance in list of enemies_in_screen that collided
for (var i = 0; i < list_length; i++) {
	
	//find a enemy instance
    var enemy_instance = ds_list_find_value(global.enemies_in_screen, i); 
	
	//check if this instance collided with the player
    if (place_meeting(x, y, enemy_instance)) {
		//create an explosion
		instance_create_depth(x, y, depth-5, obj_explosion);
		
        enemy_instance.current_hp -= 999; //subtract hp of enemy
		current_hp -= enemy_instance.touch_damage; //subtract hp of player
		break; 
    }
}

//game_mode 0 will awlays shoot automatically 
if(global.game_mode == 0){
	shoot(weapon);
}

no_hp_destroy(self);