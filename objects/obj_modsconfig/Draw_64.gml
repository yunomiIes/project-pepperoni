draw_set_font(global.bigfont)
draw_sprite_tiled(bg_blackbg, 0, 0, 0)
draw_set_halign(fa_center)
draw_set_color(c_white)
var _os = optionselected
var heatmeter_os = global.heatingthemeter
draw_text_colour(480, 50, "HEATMETER", c_white, c_white, c_white, c_white, ((_os == 0) ? 1 : 0.5))
draw_text_colour(380, 100, "OFF", c_white, c_white, c_white, c_white, ((heatmeter_os == 0) ? 1 : 0.5))
draw_text_colour(580, 100, "ON", c_white, c_white, c_white, c_white, ((heatmeter_os == 1) ? 1 : 0.5))
var _elmlap_ = global.elmlapping
draw_text_colour(480, 180, "EGG LAPPING", c_white, c_white, c_white, c_white, ((_os == 1) ? 1 : 0.5))
draw_text_colour(380, 230, "OFF", c_white, c_white, c_white, c_white, ((_elmlap_ == 0) ? 1 : 0.5))
draw_text_colour(580, 230, "ON", c_white, c_white, c_white, c_white, ((_elmlap_ == 1) ? 1 : 0.5))
var _elmbrick = global.elmlapbrick
draw_text_colour(480, 410, "EGG LAP BLOCKS", c_white, c_white, c_white, c_white, ((_os == 2) ? 1 : 0.5))
draw_text_colour(380, 460, "OFF", c_white, c_white, c_white, c_white, ((_elmbrick == 0) ? 1 : 0.5))
draw_text_colour(580, 460, "ON", c_white, c_white, c_white, c_white, ((_elmbrick == 1) ? 1 : 0.5))
