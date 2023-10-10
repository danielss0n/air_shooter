
//delete object after reaching the limit of window size
global.out_screen_destroy = function( obj ) {
	
	if ( obj.x < 0 || obj.y < 0 ) {
		instance_destroy( obj );
	}

	if ( obj.x > room_width || obj.y > room_height ) {
		instance_destroy( obj );
	}
	
}
