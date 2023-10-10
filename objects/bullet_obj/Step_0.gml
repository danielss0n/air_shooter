//collision_line(x, y, xprevious, yprevious, basic_enemy_obj, false, true)
if (place_meeting( x, y, basic_enemy_obj )) {

    var enemy_instance = instance_place(x, y, basic_enemy_obj);
    
    // Verifique se uma instância de inimigo foi encontrada
    if (enemy_instance != noone) {
        // Destrua apenas a instância de inimigo que colidiu com a bala
        instance_destroy(enemy_instance);
    }
    
    // Destrua a própria instância de bala
    instance_destroy();

}

#region move

	x += lengthdir_x(move_speed, direction + accuracy_deviation);
	y += lengthdir_y(move_speed, direction + accuracy_deviation);

#endregion

global.out_screen_destroy(self);