move_speed = global.room_speed; 

//alarm[0] = 5 * room_speed; //destroy coin after seconds

direction = random(360); //get random direction degree
distance_move = move_speed * 5;	//get random distance coin will percour

//animation init variables:
curve_asset = coin_animation;
curve_position = 0;
curve_speed = 0.01;