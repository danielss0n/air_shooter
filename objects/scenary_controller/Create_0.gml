//get size of bg sprite 
sprite_size = sprite_get_height(spr_sky_1);
sprite_bg_1 = instance_create_depth(0, 0, 99, scenary_obj); //start in screen
sprite_bg_2 = instance_create_depth(0, sprite_size*-1, 99, scenary_obj); //start in back

sprite_bg_1.sprite_index = spr_sky_1;
sprite_bg_2.sprite_index = spr_sky_1;