#region GET ENEMY STATS
	name = "Basic Shooter"
	move_speed = 4;
	max_hp = 100;
	current_hp = max_hp;
	coins_quantity = 2;
	touch_damage = 100;
#endregion


deegres_deviation = 10 * global.room_speed; //get deviation
//multiply by -1 for the two directions
accuracy_deviation = random_range(deegres_deviation * -1, deegres_deviation);

x = random_range(0, room_width)
	
//spawn random coordinate halfway up the window
y = 0 - sprite_height;

//sum direction with deviation
direction = 270;


turn = false;

turn_wait = random_range(.4, .6);

random_percentage = random(int64(100)); 
turn_side = random_percentage >= 50 ? 1 : -1; 


alarm[0] = turn_wait * move_speed * room_speed;
alarm[1] = 1*room_speed;
	
image_yscale = -1; //invert y image
ds_list_add(global.enemies_in_screen, self);