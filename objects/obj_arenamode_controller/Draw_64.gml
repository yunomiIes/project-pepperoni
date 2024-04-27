if ((obj_player1.state == (86 << 0)))
    return;
draw_set_font(global.bigfont)
draw_set_valign(fa_middle)
draw_set_color(c_white)
var _fill = time
var _currentbarpos = (maxtime - _fill)
_perc = (_currentbarpos / maxtime)
var _max_x = 430
var _barpos = (_max_x * _perc)
if (!surface_exists(bar_surface))
    bar_surface = surface_create(430, 38)
real_barpos = lerp(real_barpos, _barpos, 0.05)
var _barfillpos = (floor(real_barpos) + 6)
if ((_barfillpos > 0))
{
    surface_resize(bar_surface, _barfillpos, 31)
    surface_set_target(bar_surface)
    draw_clear_alpha(c_black, 0)
    var clip_x = (timer_x + 8)
    var clip_y = (timer_y + 7)
    draw_sprite_tiled(spr_bosstimer_barfill, 0, barfill_x, 0)
    surface_reset_target()
    draw_surface(bar_surface, clip_x, clip_y)
}
draw_sprite(spr_bosstimer_bar, -1, timer_x, timer_y)
if ((bell_sprite != spr_bosstimer_hitbell))
    draw_sprite(spr_bosstimer_hammer, 0, ((timer_x + 11) + real_barpos), (timer_y + 12))
draw_sprite(bell_sprite, bell_index, (timer_x + 440), (timer_y + 21))
draw_text(480, 35, ("ROUND " + string((global.arenaphase + fake_num))))
var string_leng = string_width((string(enemies_left) + " LEFT"))
var _yy = (timer_ystart + 20)
if instance_exists(obj_baddie)
{
    var _xx = ((480 + (string_leng / 2)) + 25)
    var inst = instance_nearest(obj_player1.x, obj_player1.y, obj_baddie)
    var dir = point_direction((_xx + camera_get_view_x(view_camera[0])), (_yy + camera_get_view_y(view_camera[0])), inst.x, inst.y)
    draw_sprite_ext(spr_arenaarrow, 0, _xx, _yy, 1, 1, dir, c_white, 1)
}
var _hx = 121
var offset = 60
var halfway = (player_hp_max / 2)
var _tx = (offset * (halfway - 1))
_hx -= (_tx / 2)
var _hy = 130
if global.heatingthemeter
    _hy += 25
hp_index += 0.35
if ((floor(image_index) == (image_number - 1)))
{
    sprite_get_number(spr_bossfight_playerhp)
    hp_index = frac(hp_index)
}
for (var i = 0; i < player_hp_max; i++)
{
    var _pos = (i % halfway)
    _xx = (_hx + (_pos * offset))
    var _hpy = _hy
    if ((i >= halfway))
    {
        _hpy += 10
        _xx += 10
    }
    draw_sprite_ext(spr_bossfight_playerhp, hp_index, _xx, _hpy, 1, 1, 0, c_black, 1)
    if ((i < player_hp))
        draw_sprite_ext(spr_bossfight_playerhp, hp_index, _xx, _hpy, 1, 1, 0, c_white, 1)
}
