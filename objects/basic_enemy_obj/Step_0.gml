//colision with bullet
/*
if (place_meeting( x, y, bullet_obj ) ) {
	instance_destroy();
	enemy_destroy_array();
}
*/




y += move_speed;
x += move_speed * move_dir;

//if enemy out of window 
if ( x>=room_width || x<=0 || y>=room_height || y<=0 ) { 
	enemy_destroy_array();
}

//delete instance of enemy in the array of enemies
function enemy_destroy_array(){
	return true
}

global.out_screen_destroy(self);