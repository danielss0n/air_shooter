draw_set_color(c_red);
draw_set_font(font_add);

var current_coins = global.player.match_coins;
var current_kills = global.player.match_kills;

draw_text(10, 10,"COINS: " + string(current_coins));
draw_text(10, 30,"KILLS: " + string(current_kills));