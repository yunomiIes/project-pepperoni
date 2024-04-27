if ((room == editor_room))
    return;
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if is_bossroom()
    return;
if (global.use_temperature && global.oldsprites)
{
    var _width = sprite_get_width(spr_temperature_meterfill)
    var _height = sprite_get_height(spr_temperature_meterfill)
    global.temperature = clamp(global.temperature, 0, (global.temp_thresholdnumber * 100))
    var _tmp = (global.temperature / (global.temp_thresholdnumber * 100))
    var _top = 0
    var _height2 = (_height * _tmp)
    draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, _top, _width, _height2, 864, (192 + _height), 1, -1, c_white, 1)
    draw_sprite(spr_temperature_meter, 0, 864, 192)
}
if ((obj_player1.character != "PZ"))
{
    var collect_x = irandom_range((-collect_shake), collect_shake)
    var collect_y = irandom_range((-collect_shake), collect_shake)
    var tv_x = 845
    var tv_y = 80
    var _cx = (tv_x + combo_posX)
    var _cy = (((tv_y + 117) + hud_posY) + combo_posY)
    var _perc = (global.combotime / 60)
    var _minX = (_cx - 56)
    var _maxX = (_cx + 59)
    combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
    combofill_y = _cy
    draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
    draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
    draw_set_font(global.combofont2)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    var _tx = (_cx - 64)
    var _ty = (_cy - 12)
    var _str = string(global.combo)
    var num = string_length(_str)
    for (var i = num; i > 0; i--)
    {
        var char = string_char_at(_str, i)
        draw_text(_tx, _ty, char)
        _tx -= 22
        _ty -= 8
    }
}
else
{
    draw_set_font(global.combofontSP)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var _ct = (string(global.combofontSP) + "x")
    _cx = ((652 + obj_camera.original_cam_width) - 960)
    var _hy = ((88 + combo_y) + hand_y)
    _hy = clamp(_hy, 88, 142)
    if (!surface_exists(goo_surface))
    {
        goo_surface = surface_create(100, 180)
        surface_set_target(goo_surface)
        draw_clear_alpha(c_black, 0)
        surface_reset_target()
    }
    surface_set_target(goo_surface)
    draw_clear_alpha(c_black, 0)
    draw_sprite(spr_combometer_goo, goo_index, -3, (_hy + 6))
    draw_set_blend_mode(3)
    draw_sprite(spr_combometer_cut, 0, 0, 0)
    draw_set_blend_mode(0)
    surface_reset_target()
    draw_surface(goo_surface, ((_cx + combo_x) - 50), ((88 + combo_y) - 91))
    draw_sprite_ext(spr_combometer, -1, (_cx + combo_x), (88 + combo_y), 1, 1, 0, c_white, alpha)
    draw_sprite_ext(spr_combometer_hand, -1, (_cx + hand_x), _hy, 1, 1, 0, c_white, alpha)
    _ct = (string(global.combo) + "x")
    draw_text((_cx + combo_x), combo_y, _ct)
}
if (!surface_exists(tvbg_surface))
{
    tvbg_surface = surface_create(278, 268)
    surface_set_target(tvbg_surface)
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
}
if ((room != strongcold_endscreen))
{
    if ((obj_player1.character != "PZ"))
    {
        draw_sprite_ext(spr_tv_bg, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
        draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
    }
    else
        draw_sprite_ext(spr_pizzelletv_newBG, 0, (((832 - DrawX) + obj_camera.original_cam_width) - 960), (((74 + DrawY) + bobbing) + OldDrawY), 1, 1, 0, c_white, 1)
}
if ((state == (250 << 0)) && (obj_player1.character != "PZ"))
{
    draw_static = 1
    draw_sprite(spr_tv_whitenoise, tv_trans, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY))
}
if ((bubblespr != -4))
    draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if ((bubblespr == spr_tv_bubble))
{
    promptx -= promptspd
    if ((bubblespr != spr_tv_bubbleclose) && (promptx < (350 - string_width(prompt))))
    {
        bubblespr = spr_tv_bubbleclose
        bubbleindex = 0
    }
    draw_text_color((promptx - 350), 50, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, 350, 0)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
if instance_exists(obj_pizzaball)
    draw_text(832, 300, ((string(global.golfhit) + " ") + "GOLF HIT"))
if ((obj_player1.character != "PZ"))
{
    if (global.panic && (!global.deathmode))
    {
        var _fill = global.fill
        var _currentbarpos = (chunkmax - _fill)
        _perc = (_currentbarpos / chunkmax)
        var _max_x = 299
        var _barpos = (_max_x * _perc)
        if (!surface_exists(bar_surface))
            bar_surface = surface_create(298, 30)
        var _barfillpos = (floor(_barpos) + 13)
        if ((_barfillpos > 0))
        {
            surface_resize(bar_surface, _barfillpos, 30)
            surface_set_target(bar_surface)
            draw_clear_alpha(c_black, 0)
            var clip_x = (timer_x + 3)
            var clip_y = (timer_y + 5)
            for (i = 0; i < 3; i++)
                draw_sprite(spr_timer_barfill, 0, (barfill_x + (i * 173)), 0)
            surface_reset_target()
            draw_surface(bar_surface, clip_x, clip_y)
        }
        draw_sprite(spr_timer_bar, -1, timer_x, timer_y)
        draw_sprite(johnface_sprite, johnface_index, ((timer_x + 13) + _barpos), (timer_y + 20))
        draw_sprite(pizzaface_sprite, pizzaface_index, (timer_x + 320), (timer_y + 10))
        if ((global.oldsprites == 0))
        {
            var minutes = 0
            for (var seconds = ceil((global.fill / 12)); seconds > 59; seconds -= 60)
                minutes++
            if ((seconds < 10))
                seconds = concat("0", seconds)
            else
                seconds = string(seconds)
            draw_set_halign(fa_center)
            draw_set_valign(fa_middle)
            draw_set_font(global.bigfont)
            draw_text((timer_x + 153), (timer_y + 18), concat(minutes, ":", seconds))
        }
    }
}
else
{
    draw_set_font(global.smallfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    if ((global.fill > global.maxwave))
        global.maxwave = global.fill
    target_fill = lerp(target_fill, global.fill, 0.03)
    target_fill = approachSP(target_fill, global.fill, 10)
    var timerx = (480 + ((obj_camera.original_cam_width / 2) - 480))
    var timery = (((490 + timer_ySP) + obj_camera.original_cam_height) - 540)
    var perc = clamp((1 - (target_fill / global.maxwave)), 0, 1)
    var john_ypos = (-12 * perc)
    var dist = clamp((perc * 268), 0, 268)
    var timeinsecs = floor((target_fill / 60))
    var mins = max(floor((timeinsecs / 60)), 0)
    var secs = max((timeinsecs % 60), 0)
    var display_mins = string(abs(mins))
    var display_secs = string(abs(secs))
    if ((secs < 10))
        display_secs = ("0" + display_secs)
    if ((coneball_sprite != spr_bartimer_showtime))
    {
        draw_sprite_ext(spr_bartimer_normalBack, coneball_index, timerx, timery, 1, 1, 0, c_white, 1)
        draw_sprite_part(spr_bartimer_strip, 0, 0, 0, (dist + 45), 113, (timerx - 184), (timery - 56))
        draw_sprite_ext(spr_bartimer_roll, roll_index, ((timerx - 147) + dist), ((timery + john_ypos) + 31), 1, 1, 0, c_white, 1)
    }
    draw_sprite_ext(coneball_sprite, floor(coneball_index), timerx, timery, 1, 1, 0, c_white, 1)
    draw_text(timerx, (timery - 50), ((display_mins + ":") + display_secs))
}
if (!surface_exists(tvbg_surface))
{
    tvbg_surface = surface_create(278, 268)
    surface_set_target(tvbg_surface)
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
}
bobbing = waveSP(2, -2, 3, 0)
if ((obj_player1.character == "PZ"))
{
    surface_set_target(tvbg_surface)
    draw_clear_alpha(c_black, 0)
    draw_set_blend_mode(3)
    draw_sprite(spr_pizzelletv_cut, 0, 0, 0)
    draw_set_blend_mode(0)
    surface_reset_target()
    draw_surface(tvbg_surface, ((693 + obj_camera.original_cam_width) - 960), ((-60 + DrawY) + bobbing))
    draw_sprite_ext(sprite_index, image_index, (((832 - DrawX) + obj_camera.original_cam_width) - 960), (((74 + DrawY) + bobbing) + OldDrawY), 1, 1, 0, c_white, 1)
    draw_sprite_ext(tvspr, image_index, (((832 - DrawX) + obj_camera.original_cam_width) - 960), (((74 + DrawY) + bobbing) + OldDrawY), 1, 1, 0, c_white, 1)
    if draw_static
    {
        static_index += 0.3
        draw_sprite_ext(spr_tv_newstatic, static_index, ((832 + obj_camera.original_cam_width) - 960), ((74 + DrawY) + bobbing), 1, 1, 0, c_white, 1)
    }
    draw_sprite_ext((draw_static ? spr_tvpropellerstatic : spr_tvpropeller), propindex, ((832 + obj_camera.original_cam_width) - 960), ((74 + DrawY) + bobbing), 1, 1, 0, c_white, 1)
}
var y_wave = waveSP(-3, 3, 4, 0)
var x_wave = waveSP(-2, 2, 3, 0)
var x_wave2 = waveSP(-2, 2, 3, 0, (current_time + 600))
if ((global.laps > 0))
{
    draw_set_halign(fa_center)
    draw_text((50 + x_wave2), ((obj_camera.original_cam_height + y_wave) - 98), global.laps)
}
