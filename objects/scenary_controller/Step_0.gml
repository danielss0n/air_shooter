//move bg
sprite_bg_1.y+=global.room_speed*2;
sprite_bg_2.y+=global.room_speed*2;

//check if bg 1 is out of the room
if (sprite_bg_1.y > room_height) {
    sprite_bg_1.y = sprite_bg_2.y - sprite_size;
}
//check if bg 2 is out of the room
if (sprite_bg_2.y > room_height) {
    sprite_bg_2.y =  sprite_bg_1.y - sprite_size; 
}
//loop