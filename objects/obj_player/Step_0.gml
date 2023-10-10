#region movement

	var move_x = 0; var move_y = 0;

	#region get directions

		if ( keyboard_check_direct(ord("W")) ) { move_y -= move_speed }
		
		if ( keyboard_check_direct(ord("S")) ) { move_y += move_speed }
		
		if ( keyboard_check_direct(ord("A")) ) { move_x -= move_speed }
		
		if ( keyboard_check_direct(ord("D")) ) { move_x += move_speed }

	#endregion

	#region normalize diagonals

		if ( move_x != 0 && move_y != 0 ) {
	
			var move_length = point_distance(0, 0, move_x, move_y);
			var magnitude = move_speed;
	
		    move_x = move_x * (magnitude / move_length);
		    move_y = move_y * (magnitude / move_length);
	
		}
	
	#endregion

	#region move pixels in screen
	
		//stop move in the limit of window
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
	
		x += move_x * move_speed;
		y += move_y * move_speed;	
		
	#endregion

#endregion

function shoot_bullets(aim_dir) {
	
	var projectiles =  ds_list_find_value(global.weapons, global.current_weapon)[?"projectiles"];
	
	for ( var i = 1; i <= projectiles; i ++ ) {
		
		//cordinates where bullets spawn
		var initial_x = x + player_mid_w - bullet_mid_w;
		var initial_y = y + player_mid_h - bullet_mid_h;
		
		var x_displacement = i * 20;
		
		//create obj
		bullet = instance_create_depth(initial_x, initial_y, depth-1, bullet_obj);
		
		//adjust the mouse cordinate
		var adjusted_x = mouse_x - player_mid_w;
		var adjusted_y = mouse_y - player_mid_h;
		
		bullet.direction = point_direction( x, y, adjusted_x, adjusted_y );
		
	}	
	
	//get the weapon by ds
	var weapon = ds_list_find_value(global.weapons, global.current_weapon);
	//subtract the values of current magazine
	weapon[?"current_magazine"] = weapon[?"current_magazine"] - 1;
	show_debug_message( weapon[?"current_magazine"] )
	
}

#region change weapon

	function change_weapon() {
		
		//delay for click
		var switch_delay = 15;
		//quantity of weapons in inventory
		var total_weapons = ds_list_size(global.weapons);
		
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

	if (keyboard_check_released(vk_space)) {
	    change_weapon();
	}


#endregion

#region shoot

	var aim_dir = point_direction(x, y, mouse_x, mouse_y);
	
	#region check first shoot
	
	var weapon = ds_list_find_value(global.weapons, global.current_weapon);
		//if there is bullets in magazine
		if ( weapon[?"current_magazine"] > 0 ) {

			if ( mouse_check_button(mb_left) ) {
				
				if ( !instance_exists(bullet) || can_shoot ) {
					
					shoot_bullets(aim_dir)
					//can_shoot in creation is true 
					can_shoot = false; 
					
				}
			}
			
		//else there is no bullets and it has to reload
		} else {
			//timer in miliseconds
			timer_reload ++;
			//miliseconds exceed the reload time, then reset times shooted
			if ( timer_reload >= ds_list_find_value(global.weapons, global.current_weapon)[?"reload_time"]*60) {
				weapon[?"current_magazine"] = weapon[?"magazine"];
				timer_reload = 0;
			}	
		}

	#endregion

	#region fire rate delay
	
		//start if the bullet exist 
		if ( instance_exists(bullet) ) {
			
			//start after can_shoot changed to false
			if ( !can_shoot ) {
				
				bullet.rate_timer ++;
				
				if ( bullet.rate_timer >= bullet.fire_rate ) {
						
					bullet.rate_timer = 0;
					
					can_shoot = true; //fire again til magazine 0
					
				}
			}
		}

	#endregion

#endregion